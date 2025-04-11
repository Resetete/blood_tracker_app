# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                  :bigint           not null, primary key
#  encrypted_password  :string           default(""), not null
#  remember_created_at :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  admin               :boolean
#  username            :string           default(""), not null
#  recovery_codes      :jsonb            default([]), not null, is an Array
#  security_questions  :jsonb            default([]), is an Array
#
class User < ApplicationRecord
  include AccountRecovery::RecoveryHelpers

  serialize :recovery_codes, Array
  encrypts :recovery_codes, deterministic: true
  serialize :security_questions, Array
  encrypts :security_questions, deterministic: true

  attr_accessor :is_being_updated

  SECURITY_QUESTIONS = [
    'What is the name of your favorite teacher from elementary school?',
    'What was the name of your first pet?',
    'In which city were you born?',
    'What was your first vacation destination you traveled alone to?',
    'What city were you born in?',
    'What is the title of your favorite book?',
    'What was the make and model of your first e-bike/cargo-bike?',
    "What is your mother's maiden name?",
    'What is the title of your all-time favorite movie?',
    'What was the first concert you attended?',
    'What is your oldest siblings middle name?',
    'In what city or town did your parents meet?'
  ].freeze

  has_many :hemigrams, dependent: :destroy
  # TODO: should probably just be the hemigram_dates instead of record_dates
  has_many :record_dates, class_name: 'Hemigrams::Date', dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :validatable, :recoverable
  devise :database_authenticatable, :registerable, :rememberable

  has_one :chart_setting, class_name: 'Hemigrams::ChartSetting'

  validates :username, presence: true, uniqueness: true, length: { in: 5..35 }
  validate :validates_no_whitespace_in_username
  validate :validates_username_format
  validates :password, confirmation: true
  validates :password_confirmation, presence: true, if: -> { password.present? }

  with_options if: :being_updated? do
    validate :validates_security_questions_present_and_unique
    validate :validates_security_answers_complexity_unique
  end

  # Only on user creation recovery codes and questions are automatically generated as defaults
  before_create :generate_recovery_codes
  before_create :generate_default_security_questions_and_answers

  def admin?
    admin
  end

  def generate_recovery_codes
    self.recovery_codes = 5.times.map { SecureRandom.alphanumeric(8) }
    self.save if persisted?
  end

  def select_random_questions_with_answers
    SECURITY_QUESTIONS.sample(3).map do |question|
      [question, 'Your answer']
    end
  end

  # evaluates that the user has set their own security questions and
  # are not using the default ones
  def custom_security_questions?
    validates_security_questions_present_and_unique
  end

  private

  def being_updated?
    is_being_updated && persisted?
  end

  # validates that we have different questions and answer combinations and exactly 3 pairs
  # this is required to prevent returning the automated questions and answers
  def validates_security_questions_present_and_unique
    return true if security_questions.present? && sanitized_questions_with_answers.uniq.length == 3

    errors.add(:security_questions, 'must be present and unique')
  end

  def validates_security_answers_complexity_unique
    answers = sanitized_questions_with_answers.map(&:second)
    return if answers.uniq.length == 3 && !default_answers?(sanitized_questions_with_answers)

    errors.add(:security_question_answers, 'must be unique and cannot be the default ones')
  end

  def validates_no_whitespace_in_username
    return unless username.present? && username =~ /\s/

    errors.add(:username, 'cannot contain whitespaces')
  end

  def validates_username_format
    return if username =~ /\A[a-zA-Z0-9_:+-]+\z/

    errors.add(:username, 'can only contain lower or uppercase letters, numbers and +, :, - or _')
  end

  def sanitized_questions_with_answers
    security_questions.reject { |question, answer| question.blank? || answer.blank? }
  end

  def generate_default_security_questions_and_answers
    self.security_questions = select_random_questions_with_answers
  end
end
