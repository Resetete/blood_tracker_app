# frozen_string_literal: true

module Hemigrams
  class ParameterMetadata < ApplicationRecord
    validates :parameter_name, presence: true, uniqueness: true
    validates :abbreviations, presence: true
    validates :chart_unit, presence: true
    validates :upper_limit, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :lower_limit, presence: true, numericality: { greater_than_or_equal_to: 0 }

    UNITS = {
      thrombozythes: ['10^3/µL', 'g/L'],
      white_blood_cells: ['10^3/µL', '10^3/µL', 'g/L'],
      hemoglobin: ['g/dL', 'g/L'],
      hematocrit: ['%', 'L/L', 'ratio'],
      red_blood_cells: ['10^6/μL', 'T/L'],
      mean_corpuscular_volume: ['fl'],
      mean_corpuscular_hemoglobin: ['pg'],
      mean_corpuscular_hemoglobin_concentration: ['g/dL'],
      red_cell_distribution_width: ['%'],
      platelet_distribution_width: ['%', 'fl'],
      mean_platelet_volume: ['fl'],
      prothrombin_time: ['seconds'],
      fibrinogen: ['g/L', 'mg/dL'],
      neutrophils: ['%'],
      lymphocytes: ['%'],
      monocytes: ['%'],
      eosinophils: ['%'],
      basophils: ['%']
    }.freeze

    def self.units(parameter)
      UNITS[parameter]
    end

    # extra table to store the units and parameter info, new model required
    # allows to add new parameters and characteristics via admin
    PARAMETERS = { thrombozythes: { short: %w[PLT thrombos], chart_unit: '10^3/µL', upper_limit: '450', lower_limit: '150' },
                   hemoglobin: { short: %w[Hb Hgb], chart_unit: 'g/dL', upper_limit: '18', lower_limit: '12' },
                   hematocrit: { short: %w[Hct], chart_unit: '%', upper_limit: '52', lower_limit: '37' },
                   red_blood_cells: { short: %w[RBC erythrocytes], chart_unit: '10^6/μL', upper_limit: '6', lower_limit: '4.5' },
                   white_blood_cells: { short: %w[WBC leukocytes], chart_unit: '10^6/μL', upper_limit: '11', lower_limit: '4' },
                   mean_corpuscular_volume: { short: %w[MCV], chart_unit: 'fl', upper_limit: '100', lower_limit: '80' },
                   mean_corpuscular_hemoglobin: { short: %w[MCH], chart_unit: 'pg', upper_limit: '34', lower_limit: '27' },
                   mean_corpuscular_hemoglobin_concentration: { short: %w[MCHC], chart_unit: 'g/dl', upper_limit: '36', lower_limit: '32' },
                   red_cell_distribution_width: { short: %w[RDW], chart_unit: '%', upper_limit: '16', lower_limit: '11' },
                   platelet_distribution_width: { short: %w[PDW], chart_unit: 'fl', upper_limit: '20', lower_limit: '9' },
                   mean_platelet_volume: { short: %w[MPV], chart_unit: 'fl', upper_limit: '13', lower_limit: '7' },
                   prothrombin_time: { short: %w[PT], chart_unit: 'seconds', upper_limit: '15', lower_limit: '11' },
                   fibrinogen: { short: %w[-], chart_unit: 'mg/dL', upper_limit: '400', lower_limit: '200' },
                   neutrophils: { short: %w[NEUT Neutro], chart_unit: '%', upper_limit: '70', lower_limit: '40' },
                   lymphocytes: { short: %w[Lymph], chart_unit: '%', upper_limit: '40', lower_limit: '20' },
                   monocytes: { short: %w[Mono], chart_unit: '%', upper_limit: '10', lower_limit: '2' },
                   eosinophils: { short: %w[EO], chart_unit: '%', upper_limit: '5', lower_limit: '1' },
                   basophils: { short: %w[BASO], chart_unit: '%', upper_limit: '2', lower_limit: '0.5' } }.freeze

    def self.short(parameter)
      parameter = PARAMETERS[parameter.downcase.to_sym]

      return '' if parameter.nil?

      parameter.values_at(:short).flatten.join(', ')
    end
  end
end
