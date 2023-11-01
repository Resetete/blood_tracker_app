# frozen_string_literal: true

class AddGlossaryOnlyToBloodCellDescriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :blood_cell_descriptions, :glossary_only, :boolean, default: true
  end
end
