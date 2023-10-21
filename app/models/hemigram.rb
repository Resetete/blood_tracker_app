# frozen_string_literal: true

# == Schema Information
#
# Table name: hemigrams
#
#  id          :bigint           not null, primary key
#  parameter   :string
#  value       :string
#  unit        :string
#  user_id     :integer
#  date        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  short       :string
#  chart_unit  :string
#  chart_value :string
#

# stores the user blood work data
# parameter is the blood value name (e.g. thrombocythe)
class Hemigram < ApplicationRecord
  # Hide attributes values when querying the model
  self.filter_attributes += %i[parameter value]

  encrypts :parameter, deterministic: true # deterministic: allows querying the db data
  encrypts :value, deterministic: true # deterministic: allows querying the db data
  encrypts :chart_value, deterministic: true # deterministic: allows querying the db data

  belongs_to :user

  validates :parameter, presence: true
  validates :unit, presence: true
  validates :date, presence: true
  validate :validate_date_not_in_future
  validate :validate_only_one_entry_per_parameter_per_day

  before_save :convert_value_to_chart_unit_value

  scope :for_user, ->(user) { where(user_id: user.id) }

  # extra table to store the units and parameter info, new model required
  # allows to add new parameters and characteristics via admin
  PARAMETERS = { thrombozythes: { short: %w[PLT thrombos], chart_unit: '10^3/µL', upper_limit: '450', lower_limit: '150' },
                 hemoglobin: { short: %w[Hb Hgb], chart_unit: 'g/dL', upper_limit: '18', lower_limit: '12' },
                 hematocrit: { short: %w[Hct], chart_unit: '%', upper_limit: '52', lower_limit: '37' },
                 red_blood_cells: { short: %w[RBC erythrocytes], chart_unit: '10^6/μL', upper_limit: '6', lower_limit: '4.5' },
                 white_blood_cells: { short: %w[WBC leukocytes], chart_unit: '10^6/μL', upper_limit: '11', lower_limit: '4' },
                 mean_corpuscular_volume: { short: %w[MCV], chart_unit: 'fl', upper_limit: '100', lower_limit: '80' },
                 mean_corpuscular_hemoglobin: { short: %w[MCH], chart_unit: 'pg', upper_limit: '34', lower_limit: '27' },
                 mean_corpuscular_hemoglobin_concentration: { short: %w[MCHC], chart_unit: 'g/dl', upper_limit: '36', lower_limit: '32' },
                 red_cell_distribution_width: { short: %w[RDW], chart_unit: '%', upper_limit: '16', lower_limit: '11' },
                 platelet_distribution_width: { short: %w[PDW], chart_unit: 'fl', upper_limit: '20', lower_limit: '9' },
                 mean_platelet_volume: { short: %w[MPV], chart_unit: 'fl', upper_limit: '13', lower_limit: '7' },
                 prothrombin_time: { short: %w[PT], chart_unit: 'seconds', upper_limit: '15', lower_limit: '11' },
                 fibrinogen: { short: %w[-], chart_unit: 'mg/dL', upper_limit: '400', lower_limit: '200' },
                 neutrophils: { short: %w[NEUT Neutro], chart_unit: '%', upper_limit: '70', lower_limit: '40' },
                 lymphocytes: { short: %w[Lymph], chart_unit: '%', upper_limit: '40', lower_limit: '20' },
                 monocytes: { short: %w[Mono], chart_unit: '%', upper_limit: '10', lower_limit: '2' },
                 eosinophils: { short: %w[EO], chart_unit: '%', upper_limit: '5', lower_limit: '1' },
                 basophils: { short: %w[BASO], chart_unit: '%', upper_limit: '2', lower_limit: '0.5' },
                }

  UNITS = {
            thrombozythes: ['10^3/µL', 'g/L'],
            white_blood_cells: ['10^3/µL', '10^3/µL', 'g/L'],
            hemoglobin: ['g/dL', 'g/L'],
            hematocrit: ['%', 'L/L', 'ratio'],
            red_blood_cells: ['10^6/μL', 'T/L'],
            mean_corpuscular_volume: ['fl'],
            mean_corpuscular_hemoglobin: ['pg'],
            mean_corpuscular_hemoglobin_concentration: ['g/dL'],
            red_cell_distribution_width: ['%'],
            platelet_distribution_width: ['%', 'fl'],
            mean_platelet_volume: ['fl'],
            prothrombin_time: ['seconds'],
            fibrinogen: ['g/L', 'mg/dL'],
            neutrophils: ['%'],
            lymphocytes: ['%'],
            monocytes: ['%'],
            eosinophils: ['%'],
            basophils: ['%'],
          }

  # pagination
  self.per_page = 5

  def self.parameters
    PARAMETERS.map do |parameter, _short|
      parameter
    end
  end

  def self.short(parameter)
    parameter = PARAMETERS.dig(parameter.downcase.to_sym)

    return '' if parameter.nil?

    parameter.values_at(:short).flatten.join(', ')
  end

  def abbreviations
    return unless new_record?

    JSON.parse(short).join(', ')
  end

  def self.units(parameter)
    UNITS.dig(parameter)
  end

  def self.search(search, user)
    safe_search_query = ActionController::Base.helpers.sanitize(search).to_s
    result = where(user_id: user.id).order(created_at: :desc).select do |h|
      h.parameter.downcase.include?(safe_search_query.downcase) || h.short.downcase.include?(safe_search_query.downcase)
    end
  end

  def convert_value_to_chart_unit_value
    Hemigrams::ConvertUnitsService.new(self).execute
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

  def validate_date_not_in_future
    return unless date.present? && date > Date.current

    errors.add(:date, "can't be in the future")
  end
end
