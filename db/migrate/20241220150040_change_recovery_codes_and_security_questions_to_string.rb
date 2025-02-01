class ChangeRecoveryCodesAndSecurityQuestionsToString < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :recovery_codes, :text
    change_column :users, :security_questions, :text
  end

  def down
    change_column :users, :recovery_codes, :string, array: true, default: []
    change_column :users, :security_questions, :string, array: true, default: []
  end
end
