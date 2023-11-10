# frozen_string_literal: true

class BackfillHemigramsParameterAssociations < ActiveRecord::Migration[7.0]
  def change
    Hemigram.all.each do |hemigram|
      parameter_metadata_id = Admin::Hemigrams::ParameterMetadata.find_by(parameter_name: hemigram.parameter).id
      Hemigrams::ParameterAssociation.create!(hemigram_id: hemigram.id, parameter_metadata_id:)
    end
  end
end
