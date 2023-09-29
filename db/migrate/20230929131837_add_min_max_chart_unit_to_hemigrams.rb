class AddMinMaxChartUnitToHemigrams < ActiveRecord::Migration[7.0]
  def change
    add_column :hemigrams, :lower_limit, :decimal
    add_column :hemigrams, :upper_limit, :decimal
    add_column :hemigrams, :chart_unit, :string
    add_column :hemigrams, :chart_value, :decimal
  end
end
