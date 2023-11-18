# frozen_string_literal: true

# This class is responsible for allowing the recovering of user accounts in case the username / password was forgotten
class AccountRecoveryController < ApplicationController
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
      redirect request.referer
    end
  end

  def use_recovery_code
    # Check if the recovery code is valid and unused
    # Update the user's password or perform necessary actions
    # Mark the recovery code as used or delete it
  end
end
