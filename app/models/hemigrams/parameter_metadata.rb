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
  end
end


