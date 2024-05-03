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
      else
        # Save the build hemigram date with associated hemigrams
        if @hemigram_date.save
          format.html { redirect_to view_user_hemigrams_path, notice: ErrorHandling::SUCCESSFUL_CREATE }
          format.turbo_stream { flash.now[:notice] = ErrorHandling::SUCCESSFUL_CREATE }
        else
          format.html { render :new, status: :unprocessable_entity } # need the status to show errors with turbo
        end
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

# TODOs:
# check the create action
# update the hemigram form and remove the date
# when creating a hemigram, it should use the hemigram date relationship (find the id of the hemigram date object)

# in the entry_fields partial, I need to render the turbo frame for create new hemigram partial. I also need to allow
# generating multiple hemigrams, as fields_for :hemigram and automatically adding such fields when clicking add new hemigram
# when I then save the hemigram date form, it should automatically create the hemigrams for the user and
# render them above the hemigram list

# later: I want to group the hemigrams by hemigram_date on the users hemigrams index page
