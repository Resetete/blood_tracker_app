class Hemigram < ApplicationRecord
    # allow adding new blood parameters and units --> new model with new, create, destroy actions
    # unit converter (separate model? Part of a printer model? printer table holds all converted blood values) --> define your own conversions (in blood parameters), new, create, destroy
    # create translations --> DE, EN of the app
    # add a search functionality to the dropdown --> pass a search params and filter the parameters

    belongs_to :user

    validates :parameter, presence: true
    validates :value, presence: true
    validates :unit, presence: true
    validates :date, presence: true

    PARAMETERS = ['thrombozythes', 'Leucozyts', 'white blood cells', 'hemoglobin', 'hematocrit'] # this will be substituted when the blood parameters models is created
    UNITS = ['10 3/ul', 'g/dl', 'fl', '%', 'pg', '10 6/ul']
    # pagination
    self.per_page = 5

    def self.parameters
      PARAMETERS.map { |parameter| [parameter.capitalize, parameter] }
    end

    def self.units
      UNITS
    end
end
