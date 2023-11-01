# frozen_string_literal: true

# == Schema Information
#
# Table name: blood_cell_descriptions
#
#  id            :bigint           not null, primary key
#  title         :string
#  description   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  parameter     :string
#  glossary_only :boolean          default(TRUE)
#

# this allows storing and editing of the description of blood cells
module Admin
  class BloodCellDescription < ApplicationRecord
    has_many :links, dependent: :destroy
    accepts_nested_attributes_for :links, allow_destroy: true, reject_if: :all_blank

    scope :glossary_only, -> { where(glossary_only: true) }
    scope :on_landing_page, -> { where(glossary_only: false) }
  end
end
