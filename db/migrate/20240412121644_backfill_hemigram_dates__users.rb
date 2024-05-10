# frozen_string_literal: true

# I need to backfill the user_ids for the hemigram dates, to connect the hemigrams,
# Hemigram dates and users
class BackfillHemigramDatesUsers < ActiveRecord::Migration[7.0]
  def change
    Hemigram.all.each do |hemigram|
      record_date_object = hemigram.record_date

      next "No record date for hemigram #{hemigram.id}" unless record_date_object

      record_date_object.update(user: hemigram.user)
    end
  end
end
