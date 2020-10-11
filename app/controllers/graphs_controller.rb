class GraphsController < ApplicationController

  def index
  end

  def parameters_per_day
    render json: Hemigram.where(user_id: current_user, parameter: 'Leucozyts').group(:parameter).group_by_day(:date).maximum(:value)
  end
end
