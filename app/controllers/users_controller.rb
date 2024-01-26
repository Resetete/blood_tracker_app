# frozen_string_literal: true

# User CRUD is controlled via devise
# This controller allows users to access their user profile info
class UsersController < ApplicationController
  before_action :require_same_user
  before_action :set_user, only: %i[show edit update hemigrams]

  def show
    @chart_setting = Hemigrams::ChartSetting.find_or_create_by(user_id: current_user.id)
    @user_parameter_ids = Hemigram.for_user(current_user).map(&:parameter_metadata).flat_map(&:ids).uniq
  end

  def edit; end

  def update
    @user.is_being_updated = true # needed to only run validations on update

    if @user.update(security_questions: formatted_security_questions)
      redirect_to view_user_path(@user), notice: 'Security questions successfully updated.'
    else
      render :edit, status: :unprocessable_entity # needs status to show error messages
    end
  end

  def hemigrams
    @hemigrams = @user.hemigrams
  end

  private

  def set_user
    @user = current_user || User.find(params[:id])
  end

  def require_same_user
    return unless current_user.id.to_s != params[:id]

    flash[:alert] = 'You can only view your own profile'
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(security_questions: %i[question answer])
  end

  def formatted_security_questions
    user_params[:security_questions].to_h.map do |_idx, question|
      [question[:question], question[:answer]]
    end
  end
end
