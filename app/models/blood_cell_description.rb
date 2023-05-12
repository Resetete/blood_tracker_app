# frozen_string_literal: true

# == Schema Information
#
# Table name: blood_cell_descriptions
#
#  id             :bigint           not null, primary key
#  title          :string
#  description    :string
#  source_links   :jsonb
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  text_generator :string
#

# this allows storing and editing of the description of blood cells
class BloodCellDescription < ApplicationRecord
  has_many :links, dependent: :destroy
  accepts_nested_attributes_for :links, allow_destroy: true, reject_if: :all_blank
end
