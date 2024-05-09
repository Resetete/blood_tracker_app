# frozen_string_literal: true

# Allows setting a date to a hemigram
module Hemigrams
  class Date < ApplicationRecord
    self.table_name = 'hemigram_dates'

    belongs_to :user
    has_many :hemigrams, foreign_key: :record_date_id, dependent: :destroy
    accepts_nested_attributes_for :hemigrams, allow_destroy: true

    scope :ordered, -> { order(date: :desc) }

    def self.search(search, user)
      safe_search_query = ActionController::Base.helpers.sanitize(search).to_s
      result = where(user_id: user.id).includes(:hemigrams).order(created_at: :desc).select do |date|
        date.date.to_s.include?(safe_search_query) ||
          date.hemigrams.select { |h| h.parameter.downcase.include?(safe_search_query.downcase) }.any? ||
          date.hemigrams.select { |h| h.short.downcase.include?(safe_search_query.downcase) }.any?
      end
    end
  end
end
