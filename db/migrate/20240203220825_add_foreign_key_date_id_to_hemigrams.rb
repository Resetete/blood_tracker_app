# frozen_string_literal: true

class AddForeignKeyDateIdToHemigrams < ActiveRecord::Migration[7.0]
  def change
    add_reference :hemigrams, :record_date, foreign_key: { to_table: :hemigram_dates }
  end
end
