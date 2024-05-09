# frozen_string_literal: true

class HemigramDatesController < ApplicationController
  before_action :authorize_user, only: [:create]

  def new
    @hemigram_date = Hemigrams::Date.new
    @hemigram_date.hemigrams.build(user_id: current_user.id)
  end

  def create
    respond_to do |format|
      if @hemigram_date.save
        # Save the build hemigram date with associated hemigrams
        format.html { redirect_to view_user_hemigrams_path, notice: ErrorHandling::SUCCESSFUL_CREATE }
        format.turbo_stream { flash.now[:notice] = ErrorHandling::SUCCESSFUL_CREATE }
      else
        format.html { render :new, status: :unprocessable_entity } # need the status to show errors with turbo
      end
    end
  end

  private

  def authorize_user
    unless current_user.id.to_s == params[:view_user_id]
      redirect_to root_path, alert: 'Unauthorized. Wrong user'
    end

    @hemigram_date = Hemigrams::Date.find_or_initialize_by(date: hemigram_date_params[:date], user_id: current_user.id)
  end

  def hemigram_date_params
    params.require(:hemigrams_date).permit(:date)
  end
end
