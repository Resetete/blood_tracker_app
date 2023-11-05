# frozen_string_literal: true

# seed the Admin::Hemigrams::ParameterMetadata table with initial data
class FillHemigramsParameterMetadataTable < ActiveRecord::Migration[7.0]
  PARAMETER_METADATA = { 'thrombozythes' => { short: %w[PLT thrombos], chart_unit: '10^3/µL', upper_limit: '450', lower_limit: '150' },
                         'hemoglobin' => { short: %w[Hb Hgb], chart_unit: 'g/dL', upper_limit: '18', lower_limit: '12' },
                         'hematocrit' => { short: %w[Hct], chart_unit: '%', upper_limit: '52', lower_limit: '37' },
                         'red_blood_cells' => { short: %w[RBC erythrocytes], chart_unit: '10^6/μL', upper_limit: '6', lower_limit: '4.5' },
                         'white_blood_cells' => { short: %w[WBC leukocytes], chart_unit: '10^6/μL', upper_limit: '11', lower_limit: '4' },
                         'mean_corpuscular_volume' => { short: %w[MCV], chart_unit: 'fL', upper_limit: '100', lower_limit: '80' },
                         'mean_corpuscular_hemoglobin' => { short: %w[MCH], chart_unit: 'pg', upper_limit: '34', lower_limit: '27' },
                         'mean_corpuscular_hemoglobin_concentration' => { short: %w[MCHC], chart_unit: 'g/dl', upper_limit: '36',
                                                                          lower_limit: '32' },
                         'red_cell_distribution_width' => { short: %w[RDW], chart_unit: '%', upper_limit: '16', lower_limit: '11' },
                         'platelet_distribution_width' => { short: %w[PDW], chart_unit: 'fL', upper_limit: '20', lower_limit: '9' },
                         'mean_platelet_volume' => { short: %w[MPV], chart_unit: 'fL', upper_limit: '13', lower_limit: '7' },
                         'prothrombin_time' => { short: %w[PT], chart_unit: 'seconds', upper_limit: '15', lower_limit: '11' },
                         'fibrinogen' => { short: %w[-], chart_unit: 'mg/dL', upper_limit: '400', lower_limit: '200' },
                         'neutrophils' => { short: %w[NEUT Neutro], chart_unit: '%', upper_limit: '70', lower_limit: '40' },
                         'lymphocytes' => { short: %w[Lymph], chart_unit: '%', upper_limit: '40', lower_limit: '20' },
                         'monocytes' => { short: %w[Mono], chart_unit: '%', upper_limit: '10', lower_limit: '2' },
                         'eosinophils' => { short: %w[EO], chart_unit: '%', upper_limit: '5', lower_limit: '1' },
                         'basophils' => { short: %w[BASO], chart_unit: '%', upper_limit: '2', lower_limit: '0.5' } }.freeze

  def up
    PARAMETER_METADATA.each do |parameter|
      parameter_name = parameter.first
      abbreviations = parameter.second[:short]
      chart_unit = parameter.second[:chart_unit]
      upper_limit = parameter.second[:upper_limit]
      lower_limit = parameter.second[:lower_limit]

      Admin::Hemigrams::ParameterMetadata.create(parameter_name:, abbreviations:, chart_unit:, lower_limit:, upper_limit:)
    end
  end

  def down
    Admin::Hemigrams::ParameterMetadata.where(key: PARAMETER_METADATA.map { |metadata| metadata[:key] }).delete_all
  end
end
