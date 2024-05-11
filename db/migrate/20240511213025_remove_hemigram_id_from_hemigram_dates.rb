# frozen_string_literal: true

# Adds a missing migration on production
class RemoveHemigramIdFromHemigramDates < ActiveRecord::Migration[7.0]
  def change
    return unless Rails.env.production?

    remove_column :hemigram_dates, :hemigram_id, :bigint
  end
end
