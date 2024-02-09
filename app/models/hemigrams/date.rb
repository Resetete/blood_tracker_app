# frozen_string_literal: true

# Allows setting a date to a hemigram
module Hemigrams
  class Date < ApplicationRecord
    self.table_name = 'hemigram_dates'

    belongs_to :hemigram

    validates :date, presence: true, uniqueness: { scope: :hemigram_id }

    scope :ordered, -> { order(date: :desc) }
  end
end
