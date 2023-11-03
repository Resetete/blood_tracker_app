# frozen_string_literal: true

module Hemigrams
  class ChartSettingsController < ApplicationController
    before_action :set_chart_setting, only: %i[create edit update destroy]

    # TODO: do I need the new and create action?
    def new; end

    def create; end

    def edit; end

    def update
      if @chart_setting.update(chart_setting_params)
        redirect_to request.referer
      else
        redirect_to request.referer, notice: ErrorHandling::UNSUCCESSFUL_UPDATE
      end
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
