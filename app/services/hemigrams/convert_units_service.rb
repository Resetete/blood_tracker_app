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
      to_unit = Admin::Hemigrams::ParameterMetadata.find_by(parameter_name: hemigram.parameter).chart_unit

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
        ['10^9/L', '10^3/μL'] => 1,
        ['10^3/μL', '10^9/L'] => 1,

        ['/nL', '10^3/μL'] => 1,
        ['10^3/μL', '/nL'] => 1,

        ['/nL', '10^9/L'] => 1,
        ['10^9/L', '/nL'] => 1,

        ['kg/dL', '10^5/μL'] => 100,
        ['10^5/μL', 'kg/dL'] => 0.01,

        ['10^3/μL', 'mg/dL'] => 100,
        ['mg/dL', '10^3/μL'] => 0.01,

        ['10^6/μL', '10^3/μL'] => 0.000001,
        ['10^3/µL', '10^6/μL'] => 1_000_000

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
        ['g/dL', '%'] => 100,

        ['%', 'fL'] => 1,
        ['fL', '%'] => 1,

        ['%', 'L/L'] => 100,
        ['L/L', '%'] => 0.01,

        ['ratio', '%'] => 100,
        ['%', 'ratio'] => 0.01,

        ['ratio', 'L/L'] => 1,
        ['L/L', 'ratio'] => 1,

        ['mg/mL', 'g/L'] => 1,
        ['g/L', 'mg/mL'] => 1,

        ['10^6/μL', 'T/L'] => 1,
        ['T/L', '10^6/μL'] => 1,

        ['fL', 'μm^3'] => 1,
        ['μm^3', 'fL'] => 1,

        %w[pg fmol] => 0.06206,
        %w[fmol pg] => 16.11,

        ['g/dL', 'g/L'] => 0.1,
        ['g/L', 'g/dL'] => 10,

        ['g/dL', 'mmol/L'] => 0.6206,
        ['mmol/L', 'g/dL'] => 1.611,

        ['g/L', 'mmol/L'] => 0.06206,
        ['mmol/L', 'g/L'] => 16.11,

        ['cells/µL', '10^9/L'] => 0.001,
        ['10^9/L', 'cells/µL'] => 1_000,

        ['cells/µL', 'g/L'] => 0.001,
        ['g/L', 'cells/µL'] => 1_000,

        ['cells/pL', 'T/L'] => 0.001,
        ['T/L', 'cells/pL'] => 1_000,

        ['cells/pL', '10^6/μL'] => 0.001,
        ['10^6/μL', 'cells/pL'] => 1_000,

        ['cells/pL', '10^12/L'] => 0.001,
        ['10^12/L', 'cells/pL'] => 1_000,
      }
    end

    # Converts a value from one unit to another based on the provided conversion factors.
    # Raises an error if the conversion is unsupported.
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
