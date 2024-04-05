class HemigramDatesController < ApplicationController
  def new
    @hemigram_date = Hemigrams::Date.new
  end

  def create
    @hemigram = @hemigram_date.build_hemigram(user: current_user)
  end
end
