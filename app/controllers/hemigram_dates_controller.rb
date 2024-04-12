# frozen_string_literal: true

class HemigramDatesController < ApplicationController
  def new
    @hemigram_date = Hemigrams::Date.new
  end

  def create
    @hemigram_date = Hemigrams::Date.new(hemigram_date_params.merge(user: current_user))

    return 'Unauthorized. Wrong user' unless current_user.id == params[:view_user_id]

    @hemigram = @hemigram_date.hemigrams.build(user: current_user)

    if @hemigram_date.save
      respond_to do |format|
        format.html { redirect_to view_user_hemigrams_path, notice: ErrorHandling::SUCCESSFUL_CREATE }
        format.turbo_stream { flash.now[:notice] = ErrorHandling::SUCCESSFUL_CREATE }
      end
    else
      render :new, status: :unprocessable_entity # need the status to show errors with turbo
    end
  end

  private

  def hemigram_date_params
    params.require(:hemigrams_date).permit(:date)
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
