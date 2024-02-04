# frozen_string_literal: true

class CreateHemigramDatesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :hemigram_dates do |t|
      t.date :date, null: false
      t.references :hemigram, null: false, foreign_key: true

      t.timestamps
    end
  end
end
