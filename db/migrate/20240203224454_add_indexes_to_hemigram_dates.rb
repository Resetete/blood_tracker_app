# frozen_string_literal: true

class AddIndexesToHemigramDates < ActiveRecord::Migration[7.0]
  def change
    # Adding index to the date field to allow ordering efficiently
    add_index :hemigram_dates, :date
    # Add a composite unique index on hemigram_date_id and parameter fields
    # this ensures that a specific hemigram can only be associated to a specific date
    add_index :hemigrams, %i[record_date_id parameter], unique: true
  end
end
