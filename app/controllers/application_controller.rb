# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper ApplicationHelper
  helper GraphsHelper
  helper HemigramsHelper

  protect_from_forgery with: :exception

  before_action :authenticate_user!

  private

  def require_admin!
    return if current_user.admin?

    flash[:alert] = 'You must be an admin to access this page.'
    redirect_to root_path
  end

  def sanitize_search_query(query)
    ActionController::Base.helpers.sanitize(query)
  end
end
