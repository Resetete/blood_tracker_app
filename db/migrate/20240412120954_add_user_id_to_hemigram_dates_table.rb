# frozen_string_literal: true

class AddUserIdToHemigramDatesTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :hemigram_dates, :user, foreign_key: true
  end
end
