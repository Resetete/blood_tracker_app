class UsersController < ApplicationController
  before_action :require_same_user
  before_action :set_user, only: [:show]

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user.id.to_s != params[:id]
      flash[:alert] = 'You can only view your own profile'
      redirect_to root_path
    end
  end
end
