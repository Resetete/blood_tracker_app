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
  has_many :hemigrams, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :validatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_one :chart_setting, class_name: 'Hemigrams::ChartSetting'

  validates :security_questions, presence: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 8 }

  after_create :generate_recovery_codes

  def admin?
    admin
  end

  private

  def generate_recovery_codes
    self.recovery_codes = 5.times.map { SecureRandom.alphanumeric(8) }
  end
end
