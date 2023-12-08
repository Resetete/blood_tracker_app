# frozen_string_literal: true

# remove unwanted names from the users table, we dont want such info in the db
class RemoveNameAttributesFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
  end
end
