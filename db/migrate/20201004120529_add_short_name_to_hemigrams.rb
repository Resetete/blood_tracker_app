# frozen_string_literal: true

# migration that adds a short name to the hemigrams table
# for a blood value e.g. WBC for white blood cells
class AddShortNameToHemigrams < ActiveRecord::Migration[6.0]
  def change
    add_column :hemigrams, :short, :string
  end
end
