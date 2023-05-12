# frozen_string_literal: true

# User CRUD is controlled via devise
# This controller allows users to access their user profile info
class UsersController < ApplicationController
  before_action :require_same_user
  before_action :set_user, only: [:show]

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    return unless current_user.id.to_s != params[:id]

    flash[:alert] = 'You can only view your own profile'
    redirect_to root_path
  end
end
