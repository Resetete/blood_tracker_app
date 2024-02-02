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
  has_many :hemigrams_parameter_associations, class_name: 'Hemigrams::ParameterAssociation'
  # has_many :parameter_metadata, through: :hemigrams_parameter_associations, class_name: 'Admin::Hemigrams::ParameterMetadata'
  has_and_belongs_to_many :parameter_metadata, join_table: 'hemigrams_parameter_associations',
                                               class_name: 'Admin::Hemigrams::ParameterMetadata'

  validates :date, presence: true
  validates :parameter, presence: true
  validates :unit, presence: true
  validates :value, presence: true, numericality: { float: true }
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
    return unless entry_already_exists_on_date?

    return if persisted?

    errors.add(:value, "on #{date.to_date} for #{parameter} already exists")
  end

  def entry_already_exists_on_date?
    Hemigram.exists?(user_id:, parameter:, date: date.to_date)
  end

  def validate_date_not_in_future
    return unless date > Date.current

    errors.add(:date, "can't be in the future")
  end

  def date_present?
    date.present?
  end
end
