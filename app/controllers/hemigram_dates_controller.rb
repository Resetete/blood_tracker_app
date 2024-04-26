# frozen_string_literal: true

class HemigramDatesController < ApplicationController
  def new
    @hemigram_date = Hemigrams::Date.new
    @hemigram_date.hemigrams.build(user_id: current_user.id)
  end

  def create
    return 'Unauthorized. Wrong user' unless current_user.id.to_s == params[:view_user_id]

    # find or initialize a hemigram date object
    @hemigram_date = Hemigrams::Date.find_or_initialize_by(date: hemigram_date_params[:date], user: current_user)

    respond_to do |format|
      if @hemigram_date.persisted? || @hemigram_date.save
        # create the associated hemigrams for the date from the params
        hemigrams_params[:hemigrams_attributes].each do |param|
          # remove the destroy key and add the current user to the attributes to build the hemigram
          @hemigram_date.hemigrams.build(param[1].to_h.except!('_destroy').merge(user: current_user))
        end
      else
        format.html { render :new, status: :unprocessable_entity } # need the status to show errors with turbo
      end

      # Save the build hemigram date with associated hemigrams
      if @hemigram_date.save
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

# TODOs:
# check the create action
# update the hemigram form and remove the date
# when creating a hemigram, it should use the hemigram date relationship (find the id of the hemigram date object)

# in the entry_fields partial, I need to render the turbo frame for create new hemigram partial. I also need to allow
# generating multiple hemigrams, as fields_for :hemigram and automatically adding such fields when clicking add new hemigram
# when I then save the hemigram date form, it should automatically create the hemigrams for the user and
# render them above the hemigram list

# later: I want to group the hemigrams by hemigram_date on the users hemigrams index page
