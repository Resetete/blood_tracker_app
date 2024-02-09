# frozen_string_literal: true

module HemigramsHelper
  def form_url
    @hemigram.persisted? ? hemigram_path(@hemigram) : hemigrams_path(parameter: nil)
  end

  def form_method
    @hemigram.persisted? ? :patch : :post
  end

  def options_for_chart_units
    Admin::Hemigrams::ParameterMetadata::UNITS.values.flatten.uniq.sort
  end

  # ensures a pretty rendering of the units
  def render_unit(unit)
    case unit
    when '10^3/µL'
      '10<sup>3</sup>/µL'.html_safe
    when '10^6/μL'
      '10<sup>6</sup>/µL'.html_safe
    when '10^9/L'
      '10<sup>9</sup>/L'.html_safe
    when '10^12/L'
      '10<sup>12</sup>/L'.html_safe
    else
      unit
    end
  end
end
