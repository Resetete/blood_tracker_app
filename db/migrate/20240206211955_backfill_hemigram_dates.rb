# frozen_string_literal: true

# Copies the hemigram.date to the new Hemigrams::Date
class BackfillHemigramDates < ActiveRecord::Migration[7.0]
  def change
    Hemigram.distinct.pluck(:date).each do |date|
      # Find or create a Hemigrams::Date record for the current date
      hemigram_date = Hemigrams::Date.find_or_create_by(date:)

      # Update all hemigrams with the id of the Hemigrams::Date object
      Hemigram.where(date:).update_all(record_date_id: hemigram_date.id)
    end
  end
end
