# this is needed to be able to encrypt those fields through the encrypts model method
class ChangeRecoveryCodesAndSecurityQuestionsToJsonb < ActiveRecord::Migration[7.0]
  def up
    # 1. Remove default (not just change it!)
    change_column_default :users, :recovery_codes, nil
    change_column_default :users, :security_questions, nil

    # 2. Use raw SQL to convert columns from array to jsonb
    execute <<-SQL
      ALTER TABLE users
      ALTER COLUMN recovery_codes TYPE jsonb USING recovery_codes::jsonb;
      ALTER COLUMN security_questions TYPE jsonb USING security_questions::jsonb;
    SQL

    # 3. Re-add proper defaults
    change_column_default :users, :recovery_codes, from: nil, to: []
    change_column_default :users, :security_questions, from: nil, to: []
  end

  def down
    # Revert the changes if needed
    execute <<-SQL
      ALTER TABLE users
      ALTER COLUMN recovery_codes TYPE text[] USING recovery_codes::text[];
      ALTER COLUMN security_questions TYPE text[] USING security_questions::text[];
    SQL

    change_column_default :users, :recovery_codes, from: [], to: nil
    change_column_default :users, :security_questions, from: [], to: nil
  end