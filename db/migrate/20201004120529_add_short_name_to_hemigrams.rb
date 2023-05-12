# frozen_string_literal: true

class AddShortNameToHemigrams < ActiveRecord::Migration[6.0]
  def change
    add_column :hemigrams, :short, :string
  end
end
