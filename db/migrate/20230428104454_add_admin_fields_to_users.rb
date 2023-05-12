# frozen_string_literal: true

# Migration to add a boolean value to the Users table (devise)
# allows to define if a user is an admin
class AddAdminFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean
  end
end
