# frozen_string_literal: true

# backfill users and sett each username to the current email, before adding a unique index
class AddIndexForUsernameToUsers < ActiveRecord::Migration[7.0]
  def change
    User.update_all('username = email')

    add_index :users, :username, unique: true
  end
end
