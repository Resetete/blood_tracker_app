# frozen_string_literal: true

class RemoveValidationOfUrlOnLinks < ActiveRecord::Migration[7.0]
  def change
    change_column :links, :url, :string, null: true
  end
end
