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
end
