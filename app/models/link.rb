# frozen_string_literal: true

# == Schema Information
#
# Table name: links
#
#  id                        :bigint           not null, primary key
#  name                      :string           not null
#  url                       :string
#  blood_cell_description_id :bigint
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  text_generator            :boolean
#
class Link < ApplicationRecord
  belongs_to :blood_cell_description, class_name: 'Admin::BloodCellDescription'

  validates :name, presence: true
end
