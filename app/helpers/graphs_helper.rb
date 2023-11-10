# frozen_string_literal: true

module GraphsHelper
  def graph_annotations(min, max)
    {
      annotations: {
        line1: { type: 'line', yMin: min, yMax: min, borderColor: 'orange', borderWidth: 2 },
        line2: { type: 'line', yMin: max, yMax: max, borderColor: 'orange', borderWidth: 2 }
      }
    }
  end

  def point_background_color(chart_data, min, max)
    return unless chart_data

    chart_data.first[:data].map(&:second).map do |value|
      if value > max.to_f
        'orange'
      elsif value < min.to_f
        'orange'
      else
        'green'
      end
    end
  end

  def options_for_chart_settings_select
    user_parameters = Hemigram.for_user(current_user).pluck(:parameter).uniq
    Admin::Hemigrams::ParameterMetadata.all.select do |parameter_metadata|
      user_parameters.include?(parameter_metadata.parameter_name)
    end.map do |parameter|
      [parameter.parameter_name.humanize, parameter.id]
    end
  end
end
