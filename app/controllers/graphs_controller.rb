# frozen_string_literal: true

# Responsible to render and visualize the graphical visualization of the blood work data (Hemigrams)
class GraphsController < ApplicationController
  def index; end

  def parameter_values_per_day
    raw_data = user_parameter_datasets.map(&:unify_units)
    chart_data = raw_data.group_by{ |h| h.parameter }
                         .map{ |parameter, group| { name: parameter, data: group.map{ |entry| [entry.date.to_date, entry.value.to_i] } }
                         }.compact.flatten
    render json: chart_data
  end

  private

  def user_parameter_datasets
    user_hemigrams.select{ |h| h.parameter == params[:parameter] }
  end

  def user_hemigrams
    Hemigram.for_user(current_user)
  end
end
