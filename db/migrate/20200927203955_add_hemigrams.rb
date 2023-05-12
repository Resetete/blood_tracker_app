# frozen_string_literal: true

# Migration to create the hemigrams table
# stores the user entered blood work data values
class AddHemigrams < ActiveRecord::Migration[6.0]
  def change
    create_table :hemigrams do |t|
      t.string :parameter
      t.decimal :value
      t.string :unit
      t.integer :user_id
      t.datetime :date

      t.timestamps
    end
  end
end
