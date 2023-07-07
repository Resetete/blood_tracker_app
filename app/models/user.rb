# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean
#
class User < ApplicationRecord
  has_many :hemigrams, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # Registerable temporarly desactivated
  # TODO: allow registration when tracker is ready
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    admin
  end
end
