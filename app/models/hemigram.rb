class Hemigram < ApplicationRecord
    belongs_to :user

    validates :parameter, presence: true
    validates :value, presence: true
    validates :date, presence: true
end
