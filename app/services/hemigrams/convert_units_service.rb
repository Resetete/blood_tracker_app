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

    def normalize_unit(unit)
      normalized_unit = UnicodeUtils.nfkc(unit)

      # Remove extra spaces
      normalized_unit = normalized_unit.gsub(/\s+/, '')

      # Replace specific characters if needed
      normalized_unit = normalized_unit.gsub('μ', 'u')

      normalized_unit
    end

    def need_to_convert_unit?(to_unit)
      # ensure the comparability of special characters
      normalized_to_unit = normalize_unit(to_unit)
      normalized_hemigram_unit = normalize_unit(hemigram.unit)

      normalized_to_unit != normalized_hemigram_unit
    end

    def set_chart_value_and_unit(chart_value, chart_unit)
      hemigram.assign_attributes(chart_value:, chart_unit:)
    end

    def conversion_factors
      {
        ['10^9/L', '10^3/uL'] => 1,
        ['10^3/uL', '10^9/L'] => 1,

        ['/nL', '10^3/uL'] => 1,
        ['10^3/uL', '/nL'] => 1,

        ['/nL', '10^9/L'] => 1,
        ['10^9/L', '/nL'] => 1,

        ['kg/dL', '10^5/uL'] => 100,
        ['10^5/uL', 'kg/dL'] => 0.01,

        ['10^3/uL', 'mg/dL'] => 100,
        ['mg/dL', '10^3/uL'] => 0.01,

        ['10^6/uL', '10^3/uL'] => 1_000,
        ['10^3/uL', '10^6/uL'] => 0.001,

        ['10^3/uL', 'g/L'] => 0.0000001,
        ['g/L', '10^3/uL'] => 1_000_000,

        ['10^6/uL', 'g/L'] => 0.001,
        ['g/L', '10^6/uL'] => 1_000,

        ['10^5/uL', 'kg/dL'] => 0.01,
        ['kg/dL', '10^5/uL'] => 100,

        ['mg/dL', '10^9/L'] => 0.0000001,
        ['10^9/L', 'mg/dL'] => 1_000_000,

        ['g/L', '10^9/L'] => 1,
        ['10^9/L', 'g/L'] => 1,

        ['g/dL', 'g/L'] => 0.1,
        ['g/L', 'g/dL'] => 10,

        ['g/L', '10^3/uL'] => 0.0000001,
        ['10^3/uL', 'g/L'] => 1_000_000,

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

        ['mg/mL', 'g/dL'] => 0.1,
        ['g/dL', 'mg/mL'] => 10,

        ['10^6/uL', 'T/L'] => 1,
        ['T/L', '10^6/uL'] => 1,

        ['fL', 'um^3'] => 1,
        ['um^3', 'fL'] => 1,

        %w[pg fmol] => 0.06206,
        %w[fmol pg] => 16.11,

        ['g/dL', 'g/L'] => 0.1,
        ['g/L', 'g/dL'] => 10,

        ['g/dL', 'mmol/L'] => 0.6206,
        ['mmol/L', 'g/dL'] => 1.611,

        ['g/L', 'mmol/L'] => 0.06206,
        ['mmol/L', 'g/L'] => 16.11,

        ['cells/uL', '10^9/L'] => 0.001,
        ['10^9/L', 'cells/uL'] => 1_000,

        ['cells/uL', 'g/L'] => 0.001,
        ['g/L', 'cells/uL'] => 1_000,

        ['cells/pL', 'T/L'] => 0.001,
        ['T/L', 'cells/pL'] => 1_000,

        ['cells/pL', '10^6/uL'] => 0.001,
        ['10^6/uL', 'cells/pL'] => 1_000,

        ['cells/pL', '10^12/L'] => 0.001,
        ['10^12/L', 'cells/pL'] => 1_000,

        ['cells/uL', '10^3/uL'] => 0.001,
        ['10^3/uL', 'cells/uL'] => 1_000,

        ['10^6/uL', '10^12/L'] => 1,
        ['10^12/L', '10^6/uL'] => 1
      }
    end

    # Converts a value from one unit to another based on the provided conversion factors.
    # Raises an error if the conversion is unsupported.
    def perform_conversion(value, from_unit, to_unit)
      conversion_factor = conversion_factors[[normalize_unit(from_unit), normalize_unit(to_unit)]]

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
