# frozen_string_literal: true

module ErrorHandling
  LOOK_UP_ERROR_MESSAGE = 'An error occurred during the lookup. Please try again later.'
  SUCCESSFUL_UPDATE = 'The update was successful'
  UNSUCCESSFUL_UPDATE = 'The update was not successful'
  SUCCESSFUL_CREATE = 'Successfully created.'
  UNSUCCESSFUL_CREATE = 'Creation was not successful.'
  SUCCESSFUL_DESTROY = 'Successfully deleted.'
  UNSUCCESSFUL_ACCOUNT_RECOVERY = "Unfortunately, we couldn't restore your account. Please use a recovery code."
  BLANK_SECURITY_ANSWERS = "You need to choose your security questions and provide answers."

  def self.unsuccessful_create(error_message)
    UNSUCCESSFUL_CREATE + "due to #{error_message}"
  end

  def self.unsuccessful_update(error_message)
    UNSUCCESSFUL_UPDATE + "due to #{error_message}"
  end

  def self.unsuccessful_destroy(error_message)
    SUCCESSFUL_DESTROY + "due to #{error_message}"
  end
end
