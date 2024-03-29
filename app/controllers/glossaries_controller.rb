# frozen_string_literal: true

class GlossariesController < ApplicationController
  def glossary
    @glossary_entries = Admin::BloodCellDescription.all.sort_by(&:title)
  end
end
