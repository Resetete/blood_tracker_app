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
#  recovery_codes      :string           default([]), not null, is an Array
#  security_questions  :string           default([]), is an Array
#
class User < ApplicationRecord
  EXAMPLE_SECURITY_QUESTIONS = [
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
    'In what city or town did your parents meet?',
  ].freeze

  has_many :hemigrams, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :validatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_one :chart_setting, class_name: 'Hemigrams::ChartSetting'

  validates :username, presence: true, uniqueness: true, length: { in: 5..20 }
  validate :validates_no_whitespace_in_username
  validate :validates_username_format
  validate :validates_security_questions_present_and_unique, on: :update

  # Only on user creation recovery codes and questions are automatically generated as defaults
  after_create :generate_recovery_codes
  after_create :generate_default_security_questions_and_answers

  def admin?
    admin
  end

  def generate_recovery_codes
    self.recovery_codes = 5.times.map { SecureRandom.alphanumeric(8) }
    save
  end

  private

  def validates_security_questions_present_and_unique
    return if security_questions.present? && security_questions.uniq.length == 3

    errors.add(:security_questions, 'must be present and unique')
  end

  def validates_no_whitespace_in_username
    return unless username.present? && username =~ /\s/

    errors.add(:username, 'cannot contain whitespaces')
  end

  def validates_username_format
    return if username =~ /\A[a-zA-Z0-9_+\-]+\z/

    errors.add(:username, 'can only contain lower or uppercase letters, numbers and +, - or _')
  end

  def generate_default_security_questions_and_answers
    self.security_questions = select_random_questions_with_answers
    save
  end

  def select_random_questions_with_answers
    EXAMPLE_SECURITY_QUESTIONS.sample(3).map do |question|
      [question, 'Your answer']
    end
  end
end
