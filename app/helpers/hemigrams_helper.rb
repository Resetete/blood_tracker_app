# frozen_string_literal: true

module HemigramsHelper
  def form_url
    @hemigram.persisted? ? hemigram_path(@hemigram) : hemigrams_path(parameter: nil)
  end

  def form_method
    @hemigram.persisted? ? :patch : :post
  end
end
