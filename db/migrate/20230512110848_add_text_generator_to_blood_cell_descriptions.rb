class AddTextGeneratorToBloodCellDescriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :blood_cell_descriptions, :text_generator, :string
  end
end
