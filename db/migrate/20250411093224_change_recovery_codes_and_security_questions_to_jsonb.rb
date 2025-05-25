# this is needed to be able to encrypt those fields through the encrypts model method
class ChangeRecoveryCodesAndSecurityQuestionsToJsonb < ActiveRecord::Migration[7.0]

  # commented since it was already applied on the production db
  def up
  #   # 1. Clear the data in these columns
  #   User.update_all(recovery_codes: [], security_questions: [])

  #   # 2. Remove default (not just change it!)
  #   change_column_default :users, :recovery_codes, nil
  #   change_column_default :users, :security_questions, nil

  #   # 3. Convert to jsonb
  #   change_column :users, :recovery_codes, :jsonb, null: false, default: []
  #   change_column :users, :security_questions, :jsonb, null: false, default: []

  #   # 4. Re-add proper defaults
  #   change_column_default :users, :recovery_codes, from: nil, to: []
  #   change_column_default :users, :security_questions, from: nil, to: []
  end

  # def down
  #   # Revert the changes if needed
  #   change_column :users, :recovery_codes, :text, null: false, default: []
  #   change_column :users, :security_questions, :text, null: false, default: []

  #   change_column_default :users, :recovery_codes, from: [], to: nil
  #   change_column_default :users, :security_questions, from: [], to: nil
  # end
end
