# frozen_string_literal: true

# == Schema Information
#
# Table name: hemigrams_parameter_metadata
#
#  id             :bigint           not null, primary key
#  parameter_name :string
#  abbreviations  :string           default([]), is an Array
#  chart_unit     :string
#  upper_limit    :float
#  lower_limit    :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
module Admin
  module Hemigrams
    class ParameterMetadata < ApplicationRecord
      self.table_name = 'hemigrams_parameter_metadata'

      has_and_belongs_to_many :hemigrams, join_table: 'hemigrams_parameter_associations', class_name: 'Hemigram', optional: true

      validates :parameter_name, presence: true, uniqueness: true
      validates :chart_unit, presence: true
      validates :upper_limit, presence: true, numericality: { greater_than_or_equal_to: 0 }
      validates :lower_limit, presence: true, numericality: { greater_than_or_equal_to: 0 }

      UNITS = {
        basophils: ['%']
        basophils_absolute_count: ['cells/μL', '10^9/L']
        eosinophils: ['%'],
        fibrinogen: ['g/L', 'mg/dL'],
        hematocrit: ['%', 'L/L', 'ratio'],
        hemoglobin: ['g/dL', 'g/L', 'mg/mL'],
        lymphocytes: ['%'],
        lymphocytes_absolute_count: ['/nL', '10^9/L', '10^3/μL', 'cells/μL'],
        mean_corpuscular_hemoglobin_concentration: ['g/dL', 'mmol/L', 'g/L'],
        mean_corpuscular_hemoglobin: ['pg', 'fmol'],
        mean_corpuscular_volume: ['fL'],
        mean_platelet_volume: ['fL'],
        monocytes: ['%'],
        monocytes_absolute_count: ['10^9/L', 'g/L', '10^3/μL', 'cells/μL'],
        neutrophils: ['%'],
        neutrophils_absolute_count: ['cells/μL', '10^9/L', 'g/L'],
        platelet_distribution_width: ['%', 'fL'],
        prothrombin_time: ['seconds'],
        red_blood_cells: ['10^6/μL', 'T/L', 'cells/pl', '10^12/L'],
        red_cell_distribution_width: ['%'],
        thrombozythes: ['10^3/µL', 'g/L', '10^9/L'],
        white_blood_cells: ['10^3/µL', 'g/L', 'cells/μL', '10^9/L'],
      }.freeze

      def self.units(parameter)
        UNITS[parameter]
      end

      def self.short(parameter)
        parameter = find_by(parameter_name: parameter)

        return '' if parameter.nil?

        parameter.values_at(:abbreviations).flatten.join(', ')
      end

      delegate :humanize, to: :parameter_name, prefix: true
    end
  end
end
