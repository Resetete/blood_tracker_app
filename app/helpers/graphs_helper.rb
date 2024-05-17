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

  # deprecated
  def options_for_chart_settings_select
    user_parameters = Hemigram.for_user(current_user).pluck(:parameter).uniq
    Admin::Hemigrams::ParameterMetadata.all.select do |parameter_metadata|
      user_parameters.include?(parameter_metadata.parameter_name)
    end.map do |parameter|
      [parameter.parameter_name.humanize, parameter.id]
    end
  end

  # returns a collection of parameters to allow filtering charts
  def collection_for_chart_settings_checkboxes
    user_parameters = Hemigram.for_user(current_user).pluck(:parameter).uniq
    Admin::Hemigrams::ParameterMetadata.all.select do |parameter_metadata|
      user_parameters.include?(parameter_metadata.parameter_name)
    end
  end

  def blood_tracker_button(button_text, btn_style, button_size = '')
    # btn_style: e.g. btn-outline-light or btn-outline-dark
    # button_size: btn-lg or btn-sm
    link_to hemigrams_view_user_path(current_user), class: "btn #{btn_style} #{button_size.presence}", title: 'View Your Hemigrams' do
      [
        content_tag(:i, '', class: 'fa-solid fa-table fa-xl icon-red'),
        ' ',
        button_text
      ].join.html_safe
    end
  end

  def graphs_button(button_text, btn_style, button_size = '')
    # btn_style: e.g. btn-outline-light or btn-outline-dark
    # button_size: btn-lg or btn-sm
    link_to graphs_path, class: "btn #{btn_style} #{button_size.presence || ''}", title: 'View Your Hemigram Charts' do
      [
        content_tag(:i, '', class: 'fa-solid fa-chart-column fa-xl icon-red'),
        ' ',
        button_text
      ].join.html_safe
    end
  end
end
