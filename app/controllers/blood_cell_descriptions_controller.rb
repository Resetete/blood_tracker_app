class BloodCellDescriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  before_action :set_description, only: [:show, :edit, :update, :destroy]

  def index
    @blood_cell_descriptions = BloodCellDescription.all
  end

  def show; end

  def new
    @blood_cell_description = BloodCellDescription.new
  end

  def create
    @blood_cell_description = BloodCellDescription.new(description_params)

    if @blood_cell_description.save
      flash[:notice] = 'Successfully created'
      redirect_to @blood_cell_description
    else
      flash[:alert] = 'Could not be created'
      render :index
    end
  end

  def edit; end

  def update
    if @blood_cell_description.update(description_params)
      flash[:notice] = 'Successfully updated'
      redirect_to @blood_cell_description
    else
      flash[:alert] = 'Could not be updated'
      render :edit
    end
  end

  def destroy
    if @blood_cell_description.destroy
      flash[:notice] = 'Successfully deleted'
      redirect_to blood_cell_descriptions_path
    else
      flash[:alert] = 'Could not be deleted'
      render :edit
    end
  end

  private

  def description_params
    params.require(:blood_cell_description).permit(:title, :description, :source_links)
  end

  def set_description
    @blood_cell_description = BloodCellDescription.find(params[:id])
  end
end