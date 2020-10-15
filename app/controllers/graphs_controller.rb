class GraphsController < ApplicationController

  def index
  end

  def parameters_per_day
    raw_data = Hemigram.unit_converter(Hemigram.where(user_id: current_user, parameter: params[:parameter]))
    chart_data = raw_data.map{ |i| [i[:date], i[:value], i[:unit]] }
    render json: chart_data

    # works: #render json: Hemigram.where(user_id: current_user, parameter: params[:parameter]).group(:parameter).group_by_day(:date).maximum(:value)
  end
end
