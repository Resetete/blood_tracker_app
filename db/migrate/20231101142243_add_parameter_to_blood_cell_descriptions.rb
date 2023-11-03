# frozen_string_literal: true

class AddParameterToBloodCellDescriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :blood_cell_descriptions, :parameter, :string
  end
end
