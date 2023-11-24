# frozen_string_literal: true

# Overrides the default redirection to the root_path, and redirects to the user account page instead
module Users
  class RegistrationsController < Devise::RegistrationsController
    protected

    def after_sign_up_path_for(resource)
      view_user_path(resource)
    end
  end
end
