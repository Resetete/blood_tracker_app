# frozen_string_literal: true

# Create the Hemigram Parameter Metadata table that stores the info for each parameter
class CreateHemigramsParameterMetadata < ActiveRecord::Migration[7.0]
  def change
    create_table :hemigrams_parameter_metadata do |t|
      t.string :parameter_name
      t.string :abbreviations, array: true, default: []
      t.string :chart_unit
      t.float :upper_limit
      t.float :lower_limit
      t.timestamps
    end

    add_index :hemigrams_parameter_metadata, :parameter_name, unique: true
  end
end
