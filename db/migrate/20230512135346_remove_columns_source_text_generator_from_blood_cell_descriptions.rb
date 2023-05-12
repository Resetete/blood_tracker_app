class RemoveColumnsSourceTextGeneratorFromBloodCellDescriptions < ActiveRecord::Migration[7.0]
  def change
    remove_column :blood_cell_descriptions, :text_generator
    remove_column :blood_cell_descriptions, :source_links
  end
end
