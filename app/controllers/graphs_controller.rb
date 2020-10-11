class GraphsController < ApplicationController
  before_action :get_user_hemigrams, only: [:parameters_per_day]

  def index
  end

  def parameters_per_day
    render json: Hemigram.group_by_day(:created_at).count
  end

  private

  def get_user_hemigrams
    @user_data = Hemigram.where(user_id: current_user)
  end
end
