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

    PARAMETERS = { 'thrombozythes': { short: ['PLT', 'thrombos'] },
                   'leucozyts': { short: ['WBC', 'Leu'] } } # this will be substituted when the blood parameters models is created
    UNITS = ['10 3/ul', 'g/dl', 'fl', '%', 'pg', '10 6/ul']

    # pagination
    self.per_page = 5

    def self.parameters
      PARAMETERS.map do |parameter, short|
        parameter.capitalize
      end
    end

    # when a parameter is selected in the form, another field wth the related short names should be prefilled (not user editable)
    def self.short(parameter)
      PARAMETERS.fetch(parameter.downcase.to_sym).values.flatten # remove outer array
    end

    def self.units
      UNITS
    end

    def self.search(search, user)
      where(user_id: user.id) && (where('parameter LIKE ?', "%#{search}%") || where('short LIKE ?', "%#{search}%"))
    end
end
