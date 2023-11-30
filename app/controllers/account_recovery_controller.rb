# frozen_string_literal: true

# This class is responsible for allowing the recovering of user accounts in case the username / password was forgotten
class AccountRecoveryController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[use_recovery_code load_recovery_partial]

  def recovery_codes
    @recovery_codes = current_user.recovery_codes
  end

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

  def use_recovery_code
    recovery_code = params[:recovery_code].strip
    return redirect_to(new_user_session_path, alert: 'No recovery code provided') if recovery_code.blank?

    if user = User.find { |user| user.recovery_codes.include?(recovery_code) }
      ActiveRecord::Base.transaction do
        sign_in(user)
        user.update(recovery_codes: user.recovery_codes - [recovery_code])
        redirect_to view_user_path(user), notice: "Successfully signed in!"
      rescue => e
        redirect_to new_user_session_path, alert: "An error occured: #{e}"
      end
    else
      redirect_to new_user_session_path, alert: 'Account recovery was not successfull'
    end
  end

  def load_recovery_partial
    respond_to do |format|
      format.html { render partial: 'devise/unlocks/unlock_account_form' }
    end
  end
end
