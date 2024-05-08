# frozen_string_literal: true

class HemigramDatesController < ApplicationController
  def new
    @hemigram_date = Hemigrams::Date.new
    @hemigram_date.hemigrams.build(user_id: current_user.id)
  end

  def create
    return 'Unauthorized. Wrong user' unless current_user.id.to_s == params[:view_user_id]

    # find or initialize a hemigram date object
    @hemigram_date = Hemigrams::Date.find_or_initialize_by(date: hemigram_date_params[:date], user_id: current_user.id)

    respond_to do |format|
      if params[:add_hemigram]
        # If the "Add another hemigram" button is clicked, build a new hemigram for the existing date
        @hemigram_date.hemigrams.build(user_id: current_user.id)
        format.html { render :new, status: :unprocessable_entity }
      elsif @hemigram_date.save
        # Save the build hemigram date with associated hemigrams
        format.html { redirect_to view_user_hemigrams_path, notice: ErrorHandling::SUCCESSFUL_CREATE }
        format.turbo_stream { flash.now[:notice] = ErrorHandling::SUCCESSFUL_CREATE }
      else
        format.html { render :new, status: :unprocessable_entity } # need the status to show errors with turbo
      end
    end
  end

  private

  def hemigram_date_params
    params.require(:hemigrams_date).permit(:date)
  end

  def hemigrams_params
    params.require(:hemigrams_date).permit(:date, hemigrams_attributes: %i[id parameter value unit _destroy user])
  end
end
