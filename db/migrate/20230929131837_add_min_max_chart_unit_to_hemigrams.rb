class AddMinMaxChartUnitToHemigrams < ActiveRecord::Migration[7.0]
  def change
    add_column :hemigrams, :chart_unit, :string
    add_column :hemigrams, :chart_value, :string
  end
end
