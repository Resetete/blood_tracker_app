# this is needed to be able to encrypt those fields through the encrypts model method
class ChangeRecoveryCodesAndSecurityQuestionsToJsonb < ActiveRecord::Migration[7.0]
  def change
    # 1. Remove default (not just change it!)
    change_column_default :users, :recovery_codes, nil
    change_column_default :users, :security_questions, nil

    # 2. Convert to jsonb
    change_column :users, :recovery_codes, :jsonb, using: 'recovery_codes::jsonb', null: false
    change_column :users, :security_questions, :jsonb, using: 'security_questions::jsonb', null: false

    # 3. Re-add proper defaults
    change_column_default :users, :recovery_codes, from: nil, to: []
    change_column_default :users, :security_questions, from: nil, to: []
  end
end