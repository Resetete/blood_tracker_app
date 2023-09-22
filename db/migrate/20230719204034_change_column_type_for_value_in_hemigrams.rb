# frozen_string_literal: true

class ChangeColumnTypeForValueInHemigrams < ActiveRecord::Migration[7.0]
  def change
    change_column :hemigrams, :value, :string
  end
end
