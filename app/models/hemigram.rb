# frozen_string_literal: true

# == Schema Information
#
# Table name: hemigrams
#
#  id         :bigint           not null, primary key
#  parameter  :string
#  value      :string
#  unit       :string
#  user_id    :integer
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  short      :string
#

# stores the user blood work data
# parameter is the blood value name (e.g. thrombocythe)
class Hemigram < ApplicationRecord
  # allow adding new blood parameters and units --> new model with new, create, destroy actions
  # unit converter (separate model? Part of a printer model? printer table holds all converted blood values)
  # --> define your own conversions (in blood parameters), new, create, destroy

  # Hide attributes values when querying the model
  self.filter_attributes += %i[parameter value]

  encrypts :parameter, deterministic: true # deterministic: allows querying the db data
  encrypts :value, deterministic: true # deterministic: allows querying the db data
  encrypts :chart_value, deterministic: true # deterministic: allows querying the db data

  belongs_to :user

  validates :parameter, presence: true
  validates :unit, presence: true
  validates :date, presence: true
  validate :validate_only_one_entry_per_parameter_per_day

  before_save :convert_value_to_chart_unit_value

  scope :for_user, ->(user) { where(user_id: user.id) }

  # this will be substituted when the blood parameters model is created
  # extra table to store the units and parameter info
  PARAMETERS = { thrombozythes: { short: %w[PLT thrombos], chart_unit: 'g/dl', upper_limit: '', lower_limit: '' },
                 leucozyts: { short: %w[WBC Leu], chart_unit: 'g/dl', upper_limit: '', lower_limit: '' },
               }
  UNITS = ['10^3/ul', '1000/ul', 'g/l', '10^9/l', 'g/dl', 'fl', '%', 'pg', '10^6/ul']

  # pagination
  self.per_page = 5

  def self.parameters
    PARAMETERS.map do |parameter, _short|
      parameter
    end
  end

  # when a parameter is selected in the form, another field with the related short names
  # should be prefilled (not user editable)
  def self.short(parameter)
    PARAMETERS.fetch(parameter.downcase.to_sym).values.flatten.join(', ')
  end

  def abbreviations
    return unless new_record?

    JSON.parse(short).join(', ')
  end

  def self.units
    UNITS
  end

  def self.search(search, user)
    safe_search_query = ActionController::Base.helpers.sanitize(search).to_s
    result = where(user_id: user.id).order(created_at: :desc).select do |h|
      h.parameter.downcase.include?(safe_search_query.downcase) || h.short.downcase.include?(safe_search_query.downcase)
    end
  end

  # TODO: before_save action: convert values to a chart_unit -> depending on chart unit store converted chart_value
  # TODO: create a convert unit service that updates the hemigram with chart_unit and chart_value
  def convert_value_to_chart_unit_value
    # here I would actually call a service passing in the hemigram object
    # Hemigram::ConvertUnitService.new(self).execute
    # check the unit of each dataset and convert into the chart_unit
    # I will need to check how to convert and in which chart unit for the current parameter (e.g. thrombos have a
    # different chart unit than WBC)
    chart_unit = PARAMETERS.dig(parameter)
    self.chart_value =
      case unit
        when 'mg/dl' then value / 100
        when 'kg/dl' then value * 100
        when 'g/l' then value / 5
      else
        value
      end
  end

  def value
    super.to_f
  end

  private

  def validate_only_one_entry_per_parameter_per_day
    return unless entry_already_exists_on_date?

    if persisted? && date_changed?
      errors.add(:value, "on #{date.to_date} for #{parameter} already exists")
    end
  end

  def entry_already_exists_on_date?
    Hemigram.where(user_id: user_id)
            .where("DATE(date) = ?", date.to_date)
            .select(parameter: parameter)
            .exists?
  end
end
