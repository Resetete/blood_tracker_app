# frozen_string_literal: true

# Allows CRUD for blood cell descriptions
# Only Users that are admins can perform those actions
# Users must be logged in
module Admin
  class BloodCellDescriptionsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin!

    before_action :set_description, only: %i[show edit update destroy]

    def index
      @blood_cell_descriptions = Admin::BloodCellDescription.all.sort_by(&:title)
    end

    def show; end

    def new
      @blood_cell_description = Admin::BloodCellDescription.new
      @blood_cell_description.links.build
    end

    def create
      @blood_cell_description = Admin::BloodCellDescription.new(description_params)

      if @blood_cell_description.save
        flash[:notice] = 'Successfully created'
        redirect_to @blood_cell_description
      else
        flash[:alert] = 'Could not be created'
        render :index
      end
    end

    def edit
      @blood_cell_description.links.build
    end

    def update
      if @blood_cell_description.update(description_params)
        flash[:notice] = 'Successfully updated'
        redirect_to @blood_cell_description
      else
        flash[:alert] = "Could not be updated due to #{@blood_cell_description.errors.full_messages}"
        render :edit
      end
    end

    def destroy
      if @blood_cell_description.destroy
        flash[:notice] = 'Successfully deleted'
        redirect_to admin_blood_cell_descriptions_path
      else
        flash[:alert] = 'Could not be deleted'
        render :edit
      end
    end

    private

    def description_params
      params.require(:admin_blood_cell_description).permit(
        :title,
        :parameter,
        :glossary_only,
        :description,
        links_attributes: %i[id name url text_generator _destroy]
      )
    end

    def set_description
      @blood_cell_description = Admin::BloodCellDescription.find(params[:id])
    end
  end
end
