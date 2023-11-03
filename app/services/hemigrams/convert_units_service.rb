# frozen_string_literal: true

# Service that converts values for a hemigram parameter and stores
# a chart_unit and chart_value in the hemigram object to enable displaying all
# values in the same chart
module Hemigrams
  class ConvertUnitsService
    def initialize(hemigram)
      @hemigram = hemigram
    end

    attr_accessor :hemigram

    def execute
      value = hemigram.value
      from_unit = hemigram.unit
      to_unit = Hemigrams::ParameterMetadata.find_by(parameter_name: hemigram.parameter).chart_unit

      return set_chart_value_and_unit(value, from_unit) unless need_to_convert_unit?(to_unit)

      chart_value = perform_conversion(value, from_unit, to_unit)

      set_chart_value_and_unit(chart_value, to_unit)
    end

    private

    def need_to_convert_unit?(to_unit)
      to_unit != hemigram.unit
    end

    def set_chart_value_and_unit(chart_value, chart_unit)
      hemigram.assign_attributes(chart_value:, chart_unit:)
    end

    def conversion_factors
      {
        ['mg/dL', '10^3/μL'] => 0.01,
        ['10^3/μL', 'mg/dL'] => 100,
        ['kg/dL', '10^5/μL'] => 100,
        ['10^5/μL', 'kg/dL'] => 0.01,
        ['10^3/μL', 'mg/dL'] => 100,
        ['mg/dL', '10^3/μL'] => 0.01,
        ['10^3/μL', '10^6/μL'] => 1_000,
        ['10^6/μL', '10^3/μL'] => 0.001,
        ['10^3/μL', 'g/L'] => 0.0000001,
        ['g/L', '10^3/μL'] => 1_000_000,
        ['10^6/μL', 'g/L'] => 0.001,
        ['g/L', '10^6/μL'] => 1_000,
        ['10^5/μL', 'kg/dL'] => 0.01,
        ['kg/dL', '10^5/μL'] => 100,
        ['mg/dL', '10^9/L'] => 0.0000001,
        ['10^9/L', 'mg/dL'] => 1_000_000,
        ['g/L', '10^9/L'] => 1,
        ['10^9/L', 'g/L'] => 1,
        ['g/dL', 'g/L'] => 0.1,
        ['g/L', 'g/dL'] => 10,
        ['g/L', '10^3/µL'] => 0.0000001,
        ['10^3/µL', 'g/L'] => 1_000_000,
        ['10^9/L', 'mg/dL'] => 1_000_000_000,
        ['mg/dL', '10^9/L'] => 0.000000001,
        ['g/L', 'mg/dL'] => 100,
        ['mg/dL', 'g/L'] => 0.01,
        ['%', 'g/dL'] => 0.01,
        ['%', 'fL'] => 1,
        ['fL', '%'] => 1,
        ['%', 'L/L'] => 100,
        ['L/L', '%'] => 0.01,
        ['ratio', '%'] => 100,
        ['%', 'ratio'] => 0.01,
        ['g/dL', '%'] => 100,
        ['%', 'g/dL'] => 0.01,
        ['10^6/μL', 'T/L'] => 0.001,
        ['T/L', '10^6/μL'] => 1_000,
        ['fL', 'μm^3'] => 1,
        ['μm^3', 'fL'] => 1,
        %w[pg fmol] => 1_000,
        %w[fmol pg] => 0.001,
        ['g/dL', 'g/L'] => 0.1,
        ['g/L', 'g/dL'] => 10
      }
    end

    def perform_conversion(value, from_unit, to_unit)
      conversion_factor = conversion_factors[[from_unit, to_unit]]

      raise "Unsupported unit conversion from #{from_unit} to #{to_unit}" unless conversion_factor

      converted_value = value * conversion_factor
      custom_round(converted_value, 2)
    end

    def custom_round(value, decimal_places)
      if value < 1.0
        value
      else
        value.round(decimal_places)
      end
    end
  end
end
