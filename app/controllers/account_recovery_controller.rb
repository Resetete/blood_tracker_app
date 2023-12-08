# frozen_string_literal: true

# This class is responsible for allowing the recovering of user accounts in case the username / password was forgotten
class AccountRecoveryController < ApplicationController
  include AccountRecovery::RecoveryHelpers

  skip_before_action :authenticate_user!, only: %i[use_recovery_code load_recovery_partial use_security_questions]

  def recovery_codes
    @recovery_codes = current_user.recovery_codes
  end

  # generates recovery codes in the user view page and updates a turbo frame
  def generate_recovery_codes
    current_user.generate_recovery_codes

    if current_user.save
      respond_to do |format|
        format.turbo_stream do
          render(
            turbo_stream: turbo_stream.update(
              'user_recovery_codes',
              partial: 'users/recovery_codes',
              locals: { recovery_codes: current_user.recovery_codes }
            )
          )
        end
      end
    else
      redirect_to request.referer
    end
  end

  # allows the user to submit a recovery code and sign in
  def use_recovery_code
    recovery_code = params[:recovery_code].strip
    return redirect_to(new_user_session_path, alert: 'No recovery code provided') if recovery_code.blank?

    if user = User.find { |user| user.recovery_codes.include?(recovery_code) }
      begin
        ActiveRecord::Base.transaction do
          sign_in(user)
          user.update(recovery_codes: user.recovery_codes - [recovery_code])
        end

        redirect_to(view_user_path(user), notice: ErrorHandling::SUCCESSFUL_SIGN_IN)
      rescue => e
        redirect_to new_user_session_path, alert: "An error occured: #{e}"
      end
    else
      redirect_to new_user_session_path, alert: 'Account recovery was not successful.'
    end
  end

  # /account_recovery/use_security_questions as account_recovery_use_security_questions_path
  def use_security_questions
    user_questions_with_answers = params["question"].keys.map do |index|
      [params["question"][index], params["answer"][index].downcase.strip]
    end

    return redirect_with_error_message(ErrorHandling::BLANK_SECURITY_ANSWERS) if user_questions_with_answers.map(&:second).all?(&:empty?)
    return redirect_with_error_message(ErrorHandling::NO_CUSTOM_ANSWERS) if default_answers?(user_questions_with_answers)

    # Find the user with matching questions and answers combinations
    matching_users = find_matching_users(user_questions_with_answers)

    if matching_users.length == 1
      user = matching_users.first
      sign_in(user)
      redirect_to(view_user_path(user), notice: ErrorHandling::SUCCESSFUL_SIGN_IN)
    elsif matching_users.length > 1
      redirect_with_error_message(ErrorHandling::UNSUCCESSFUL_ACCOUNT_RECOVERY)
    else
      redirect_with_error_message(ErrorHandling::UNSUCCESSFUL_ACCOUNT_RECOVERY)
    end
  end

  def load_recovery_partial
    respond_to do |format|
      format.html { render partial: 'devise/unlocks/unlock_account_form' }
    end
  end

  private

  def find_matching_users(user_questions_with_answers)
    User.select do |user|
      user.security_questions.map { |q, a| [q, a.downcase.strip] }.sort == user_questions_with_answers.sort
    end
  end

  def redirect_with_error_message(error_message)
    redirect_to(
        request.referer,
        alert: error_message,
      )
  end
end