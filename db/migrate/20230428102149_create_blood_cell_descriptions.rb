# frozen_string_literal: true

# Migration to create the blood_cell_descriptions table
# stores the description of blood cells
class CreateBloodCellDescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :blood_cell_descriptions do |t|
      t.string :title
      t.string :description
      t.jsonb :source_links, default: []

      t.timestamps
    end
  end
end
