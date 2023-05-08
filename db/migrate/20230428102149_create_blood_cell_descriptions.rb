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
