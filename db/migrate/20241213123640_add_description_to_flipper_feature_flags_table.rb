# frozen_string_literal: true

class AddDescriptionToFlipperFeatureFlagsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :flipper_features, :description, :string
  end
end
