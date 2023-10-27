# frozen_string_literal: true

class CreateHemigramMetadata < ActiveRecord::Migration[7.0]
  def change
    create_table :hemigram_metadata do |t|
      t.string :parameter_name
      t.string :abbreviations, array: true, default: []
      t.string :chart_unit
      t.float :upper_limit
      t.float :lower_limit
      t.timestamps
    end

    add_index :hemigram_metadata, :parameter_name, unique: true
  end
end
