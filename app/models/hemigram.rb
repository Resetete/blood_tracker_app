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

  # TODO: the dates attribute can be dropped after the backfilling of the dates
  # this needs to be ensured on production
  # deprecated, I use the record_date association
  self.ignored_columns = %i[date]

  encrypts :parameter, deterministic: true # deterministic: allows querying the db data
  encrypts :value, deterministic: true # deterministic: allows querying the db data
  encrypts :chart_value, deterministic: true # deterministic: allows querying the db data

  belongs_to :user
  belongs_to :record_date, class_name: 'Hemigrams::Date', dependent: :destroy
  has_many :hemigrams_parameter_associations, class_name: 'Hemigrams::ParameterAssociation'
  has_and_belongs_to_many :parameter_metadata, join_table: 'hemigrams_parameter_associations',
                                               class_name: 'Admin::Hemigrams::ParameterMetadata'

  validates :record_date, presence: true,
                          uniqueness: { scope: %i[record_date_id user_id parameter], message: 'already contains an entry for this parameter' }

  validates :parameter, presence: true
  validates :unit, presence: true
  validates :value, presence: true, numericality: { allow_float: true, greater_than: 0 }
  validate :validate_value_unit_consistency
  validate :validate_date_not_in_future, if: :date_present?
  validate :validate_only_one_entry_per_parameter_per_day, if: :date_present?

  before_save :convert_value_to_chart_unit_value

  scope :for_user, ->(user) { where(user_id: user.id) }

  # pagination
  self.per_page = 5

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
    return unless entry_for_parameter_already_exists_on_date?

    return if persisted?

    errors.add(:value, "on #{record_date.date.to_date} for #{parameter} already exists")
  end

  def entry_for_parameter_already_exists_on_date?
    Hemigram.exists?(user_id:, parameter:, record_date: record_date.date.to_date)
  end

  def validate_date_not_in_future
    return unless record_date.date > Date.current

    errors.add(:record_date, "can't be in the future")
  end

  def validate_value_unit_consistency
    return unless unit == '%'
    return if value.between?(0, 100)

    errors.add(:value, 'needs to be between 0-100%')
  end

  def date_present?
    record_date.present?
  end
end
