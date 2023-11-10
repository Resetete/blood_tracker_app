# frozen_string_literal: true

module Admin
  module Hemigrams
    class ParameterMetadataController < ApplicationController
      before_action :authenticate_user!
      before_action :require_admin!

      before_action :set_parameter_metadatum, only: %i[update edit destroy]

      def index
        @parameter_metadata = Admin::Hemigrams::ParameterMetadata.all.sort_by(&:parameter_name)
      end

      def new
        @parameter_metadatum = Admin::Hemigrams::ParameterMetadata.new
      end

      def create
        abbreviations = parse_abbreviation_params
        @parameter_metadatum = Admin::Hemigrams::ParameterMetadata.new(parameter_metadatum_params.except(:abbreviations_string))
        @parameter_metadatum.abbreviations = abbreviations

        if @parameter_metadatum.save
          redirect_to admin_hemigrams_parameter_metadata_path, notice: ErrorHandling::SUCCESSFUL_CREATE
        else
          flash[:alert] = ErrorHandling.unsuccessful_create(@parameter_metadatum.errors.full_messages)
          redirect_to new_admin_hemigrams_parameter_metadatum_path
        end
      end

      def edit; end

      def update
        @parameter_metadatum.abbreviations = parse_abbreviation_params
        if @parameter_metadatum.update(parameter_metadatum_params.except(:abbreviations_string))
          redirect_to admin_hemigrams_parameter_metadata_path, notice: ErrorHandling::SUCCESSFUL_UPDATE
        else
          flash[:alert] = ErrorHandling.unsuccessful_update(@parameter_metadatum.errors.full_messages)
          redirect_to edit_admin_hemigrams_parameter_metadatum_path
        end
      end

      def destroy
        if @parameter_metadatum.destroy
          redirect_to admin_hemigrams_parameter_metadata_path, notice: ErrorHandling::SUCCESSFUL_DESTROY
        else
          flash.now[:alert] = ErrorHandling.unsuccessful_destroy(@parameter_metadatum.errors.full_messages)
          render @parameter_metadatum
        end
      end

      private

      def set_parameter_metadatum
        @parameter_metadatum = Admin::Hemigrams::ParameterMetadata.find(params[:id])
      end

      def parameter_metadatum_params
        params.require(:admin_hemigrams_parameter_metadata).permit(:parameter_name, :chart_unit, :upper_limit, :lower_limit,
                                                                   :abbreviations_string)
      end

      def parse_abbreviation_params
        parameter_metadatum_params[:abbreviations_string].split(',')
      end
    end
  end
end
