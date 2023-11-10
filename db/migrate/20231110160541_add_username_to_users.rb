# frozen_string_literal: true

# adds the username to the users table (used by devise) to allow logging in with username
class AddUsernameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, default: '', null: false
  end
end
