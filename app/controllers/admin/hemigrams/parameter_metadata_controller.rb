module Admin
  module Hemigrams
    class ParameterMetadataController < ApplicationController
      before_action :authenticate_user!
      before_action :require_admin!

      before_action :set_blood_parameter_metadatum, only: %i[update edit destroy]

      def index
        @blood_parameter_metadata = Admin::Hemigrams::ParameterMetadata.all.sort_by(&:parameter_name)
      end

      def new
        @blood_parameter_metadatum = Admin::Hemigrams::ParameterMetadata.new
      end

      def create
        binding.pry
        abbreviations = parameter_metadatum_params[:abbreviations_string].split(',')
        @blood_parameter_metadatum = Admin::Hemigrams::ParameterMetadata.new(parameter_metadatum_params.except(:abbreviations_string))
        @blood_parameter_metadatum.abbreviations = abbreviations

        if @blood_parameter_metadatum.save
          redirect_to admin_hemigrams_parameter_metadata_path, notice: ErrorHandling::SUCCESSFUL_CREATE
        else
          redirect_to admin_hemigrams_parameter_metadata_path, notice: ErrorHandling::UNSUCCESSFUL_CREATE
          render :new
        end

      end

      def edit; end

      def update; end

      def destroy; end

      private

      def set_blood_parameter_metadatum
        binding.pry
        @blood_parameter_metadatum = Admin::Hemigrams::ParameterMetadata.find(params[:id])
      end

      def parameter_metadatum_params
        params.require(:admin_hemigrams_parameter_metadata).permit(:parameter_name, :chart_unit, :upper_limit, :lower_limit, :abbreviations_string)
      end
    end
  end
end
