# frozen_string_literal: true

class CreateHemigramsChartSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :hemigrams_chart_settings do |t|
      t.integer :parameter_ids, array: true, default: []
      t.references :user, null: false, foreign_key: { to_table: :users, on_delete: :cascade }

      t.timestamps
    end
  end
end
