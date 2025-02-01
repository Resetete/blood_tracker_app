# frozen_string_literal: true

# Encrypting existing security questions and recovering codes
# that's needed, because an auto-encryption is added to those attributes
class EncryptSecurityQuestionsAndRecoveryCodes < ActiveRecord::Migration[7.0]
  def up
    UserWithoutEncryption.find_each do |user|
      # Encrypt recovery_codes if present and not already a JSON string
      if user.recovery_codes.present? && user.recovery_codes.is_a?(Array)
        recovery_codes_json = user.recovery_codes.to_json
        encrypted_recovery_codes = User.new(recovery_codes: recovery_codes_json).recovery_codes
      else
        encrypted_recovery_codes = user.recovery_codes
      end

      # Encrypt security_questions if present and not already a JSON string
      if user.security_questions.present? && user.security_questions.is_a?(Array)
        security_questions_json = user.security_questions.to_json
        encrypted_security_questions = User.new(security_questions: security_questions_json).security_questions
      else
        encrypted_security_questions = user.security_questions
      end

      # Update the user record with encrypted data
      user.update_columns(
        recovery_codes: encrypted_recovery_codes,
        security_questions: encrypted_security_questions
      )
    end
  end
end
