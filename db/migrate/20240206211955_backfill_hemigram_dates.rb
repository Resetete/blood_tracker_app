# frozen_string_literal: true

# Copies the hemigram.date to the new Hemigrams::Date
# and creates the new
class BackfillHemigramDates < ActiveRecord::Migration[7.0]
  def change
    Hemigram.all.each do |hemigram|
      hemigram.create_record_date(date: hemigram.date)
    end
  end
end
