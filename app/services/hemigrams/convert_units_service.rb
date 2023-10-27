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
      source_unit = hemigram.unit
      target_unit = Hemigrams::ParameterMetadata.find_by(parameter_name: hemigram.parameter).chart_unit

      return set_chart_value_and_unit(value, source_unit) unless need_to_convert_unit?(target_unit)

      chart_value = perform_conversion(value, source_unit, target_unit)

      set_chart_value_and_unit(chart_value, target_unit)
    end

    private

    def need_to_convert_unit?(target_unit)
      target_unit != hemigram.unit
    end

    def set_chart_value_and_unit(chart_value, chart_unit)
      hemigram.assign_attributes(chart_value:, chart_unit:)
    end

    def perform_conversion(value, source_unit, target_unit)
      case [source_unit, target_unit]
      when ['mg/dL', '10^3/μL']
        value / 100
      when ['kg/dL', '10^5/μL']
        value * 100
      when ['10^3/μL', 'mg/dL']
        value * 100
      when ['10^3/μL', '10^6/μL']
        value * 1000
      when ['10^6/μL', '10^3/μL']
        value / 1000
      when ['10^3/μL', 'g/L']
        value / 1_000_000
      when ['10^6/μL', 'g/L']
        value / 1000
      when ['10^5/μL', 'kg/dL']
        value / 100
      when ['mg/dL', '10^9/L']
        value / 1_000_000
      when ['g/L', '10^9/L']
        value
      when ['g/L', '10^3/µL']
        value / 100_000_000
      when ['10^9/L', 'mg/dL']
        value * 1_000_000_000
      when ['10^9/L', 'g/L']
        value
      when ['g/dL', 'g/L']
        value / 10
      when ['g/L', 'g/dL']
        value * 10
      when ['%', 'g/dL']
        value / 100
      when ['g/dL', '%']
        value * 100
      when ['10^6/μL', 'T/L']
        value / 1_000
      when ['T/L', '10^6/μL']
        value * 1_000
      when ['fL', 'μm^3']
        value
      when ['μm^3', 'fL']
        value
      when %w[pg fmol]
        value * 1_000
      when %w[fmol pg]
        value / 1_000
      when ['g/dL', 'g/L']
        value / 10
      when ['g/L', 'g/dL']
        value * 10
      when ['%', 'fL']
        value
      when ['fL', '%']
        value
      else
        raise 'Unknown unit conversion pair'
      end
    end
  end
end
