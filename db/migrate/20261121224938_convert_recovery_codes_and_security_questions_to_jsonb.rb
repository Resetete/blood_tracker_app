class ConvertRecoveryCodesAndSecurityQuestionsToJsonb < ActiveRecord::Migration[7.0]
  def up
    %w[recovery_codes security_questions].each do |col|
      next if column_exists?(:users, col, :jsonb)

      execute "ALTER TABLE users ALTER COLUMN #{col} DROP DEFAULT"
      execute "ALTER TABLE users ALTER COLUMN #{col} TYPE jsonb " \
              "USING COALESCE(to_jsonb(#{col}), '[]'::jsonb)"
      execute "ALTER TABLE users ALTER COLUMN #{col} SET DEFAULT '[]'::jsonb"
      execute "ALTER TABLE users ALTER COLUMN #{col} SET NOT NULL"
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
