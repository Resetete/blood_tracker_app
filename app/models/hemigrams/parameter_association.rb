# frozen_string_literal: true

# == Schema Information
#
# Table name: hemigrams_parameter_associations
#
#  id                    :bigint           not null, primary key
#  hemigram_id           :bigint           not null
#  parameter_metadata_id :bigint           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
module Hemigrams
  class ParameterAssociation < ApplicationRecord
    self.table_name = 'hemigrams_parameter_associations'

    belongs_to :hemigram, class_name: 'Hemigram'
    belongs_to :parameter_metadata, class_name: 'Admin::Hemigrams::ParameterMetadata'
  end
end
