# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  private

  def require_admin!
    return if current_user.admin?

    flash[:alert] = 'You must be an admin to access this page.'
    redirect_to root_path
  end
end
