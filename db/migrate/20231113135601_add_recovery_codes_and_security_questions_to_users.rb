# frozen_string_literal: true

# Adds fields for the user account recovery codes and security questions
class AddRecoveryCodesAndSecurityQuestionsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :recovery_codes, :string, array: true, default: [], null: false
    add_column :users, :security_questions, :string, array: true, default: []
  end
end
