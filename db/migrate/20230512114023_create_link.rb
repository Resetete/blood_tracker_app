# frozen_string_literal: true

class CreateLink < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :name, null: false
      t.string :url, null: false

      t.references :blood_cell_description, foreign_key: true

      t.timestamps
    end
  end
end
