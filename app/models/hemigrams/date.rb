# frozen_string_literal: true

# Allows setting a date to a hemigram
module Hemigrams
  class Date < ApplicationRecord
    self.table_name = 'hemigram_dates'

    has_many :hemigrams, foreign_key: :record_date_id, dependent: :destroy

    scope :ordered, -> { order(date: :desc) }
  end
end
