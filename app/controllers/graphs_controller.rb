# frozen_string_literal: true

# Responsible to render and visualize the graphical visualization of the blood work data (Hemigrams)
class GraphsController < ApplicationController
  def index
    @user_parameters = user_hemigrams.pluck(:parameter).uniq
  end

  # def parameter_values_per_day
  #   # TODO: data transformation should not be needed here -> use the chart_unit and chart_value to plot
  #   raw_data = user_parameter_datasets.map(&:unify_units)
  #   chart_data = raw_data.group_by{ |h| h.parameter }
  #                        .map{ |parameter, group| { name: parameter, data: group.map{ |entry| [entry.date.to_date, entry.value.to_i] } }
  #                        }.compact.flatten
  #   render json: chart_data
  # end

  def parameter_values_per_day
    raw_data = user_parameter_datasets
    chart_data = raw_data.group_by{ |h| h.parameter }
                         .map{ |parameter, group| { name: parameter, data: group.map{ |entry| [entry.date.to_date, entry.chart_value.to_i] } }
                         }.compact.flatten
    render json: chart_data
  end

  private

  def user_parameter_datasets
    user_hemigrams.select{ |h| h.parameter.capitalize == params[:parameter] }
  end

  def user_hemigrams
    Hemigram.for_user(current_user)
  end
end
