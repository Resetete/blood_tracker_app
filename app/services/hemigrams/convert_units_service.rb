# frozen_string_literal: true

# Service that converts values for a hemigram parameter and stores
# a chart_unit and chart_value in the hemigram object to enable to display all
# values in the same chart
module Hemigrams
  class ConvertUnitsService
    def initialize(hemigram)
      @hemigram = hemigram
    end

    attr_accessor :hemigram

    def execute
      value = hemigram.value
      return set_chart_value(value) unless need_to_convert_unit?

      chart_value =
        case hemigram.unit
          when 'mg/dl' then value / 100
          when 'kg/dl' then value * 100
          when 'g/l' then value / 5
        end

      set_chart_value(chart_value)
    end

    private

    def need_to_convert_unit?
      expected_chart_unit = Hemigram::PARAMETERS.dig(hemigram.parameter)

      expected_chart_unit == hemigram.unit
    end

    def set_chart_value(chart_value)
      hemigram.assign_attributes(chart_value:)
    end
  end
end
