# frozen_string_literal: true

module Hemigrams
  class ChartSettingsController < ApplicationController
    before_action :set_chart_setting, only: %i[create edit update destroy]

    def new; end

    def create
      binding.pry
    end

    def edit; end

    def update
      redirect_to graphs_path
    end

    def destroy; end

    private

    def set_chart_setting
      @chart_setting = Hemigrams::ChartSetting.find(params[:id])
    end

    def chart_setting_params
      params.require(:hemigrams_chart_setting).permit(parameter_ids: [])
    end
  end
end
