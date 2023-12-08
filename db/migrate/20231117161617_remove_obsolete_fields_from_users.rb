# frozen_string_literal: true

class RemoveObsoleteFieldsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :unconfirmed_email
    remove_column :users, :reset_password_token
    remove_column :users, :reset_password_sent_at
    remove_column :users, :confirmation_token
    remove_column :users, :confirmed_at
    remove_column :users, :confirmation_sent_at
  end
end
