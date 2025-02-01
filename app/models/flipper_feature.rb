# frozen_string_literal: true

class FlipperFeature < ActiveRecord::Base #< ApplicationRecord
  validates :key, presence: true, uniqueness: true
end
