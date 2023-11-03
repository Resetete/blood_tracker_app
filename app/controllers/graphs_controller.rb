# frozen_string_literal: true

# Responsible to render and visualize the graphical visualization of the blood work data (Hemigrams)
class GraphsController < ApplicationController
  def index
    @user_parameters = user_hemigrams.pluck(:parameter).uniq
    @charts_data = prepare_charts_data
    @chart_setting = Hemigrams::ChartSetting.find_or_create_by(user_id: current_user.id)
  end

  private

  def prepare_charts_data
    raw_data = user_hemigrams
    raw_data.group_by(&:parameter)
            .map do |parameter, group|
      {
        name: parameter,
        data: group
          .sort_by(&:date)
          .map { |entry| [entry.date.to_date, entry.chart_value.to_f] }
      }
    end.compact.flatten
  end

  def user_hemigrams
    Hemigram.for_user(current_user).select do |hemigram|
      hemigram.parameter.include?(current_user.chart_setting.parameter_ids)
    end.sort_by(&:parameter)
  end
end
