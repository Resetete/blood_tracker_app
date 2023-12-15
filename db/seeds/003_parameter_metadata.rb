# frozen_string_literal: true

# Admin::Hemigrams::ParameterMetadata

def find_parameter(parameter_name)
  Admin::Hemigrams::ParameterMetadata.find_by(parameter_name:)
end

[
  { parameter_name: 'thrombozythes', abbreviations: %w[PLT thrombos], chart_unit: '10^3/µL', upper_limit: 450.0,
    lower_limit: 150.0 },
  { parameter_name: 'hemoglobin', abbreviations: %w[Hb Hgb], chart_unit: 'g/dL', upper_limit: 18.0, lower_limit: 12.0 },
  { parameter_name: 'hematocrit', abbreviations: ['Hct'], chart_unit: '%', upper_limit: 52.0, lower_limit: 37.0 },
  { parameter_name: 'red_blood_cells', abbreviations: %w[RBC erythrocytes], chart_unit: '10^6/μL', upper_limit: 6.0,
    lower_limit: 4.5 },
  { parameter_name: 'white_blood_cells', abbreviations: %w[WBC leukocytes], chart_unit: '10^6/μL', upper_limit: 11.0,
    lower_limit: 4.0 },
  { parameter_name: 'mean_corpuscular_hemoglobin', abbreviations: ['MCH'], chart_unit: 'pg', upper_limit: 34.0,
    lower_limit: 27.0 },
  { parameter_name: 'mean_corpuscular_hemoglobin_concentration', abbreviations: ['MCHC'], chart_unit: 'g/dl', upper_limit: 36.0,
    lower_limit: 32.0 },
  { parameter_name: 'red_cell_distribution_width', abbreviations: ['RDW'], chart_unit: '%', upper_limit: 16.0,
    lower_limit: 11.0 },
  { parameter_name: 'prothrombin_time', abbreviations: ['PT'], chart_unit: 'seconds', upper_limit: 15.0, lower_limit: 11.0 },
  { parameter_name: 'fibrinogen', abbreviations: ['-'], chart_unit: 'mg/dL', upper_limit: 400.0, lower_limit: 200.0 },
  { parameter_name: 'neutrophils', abbreviations: %w[NEUT Neutro], chart_unit: '%', upper_limit: 70.0,
    lower_limit: 40.0 },
  { parameter_name: 'lymphocytes', abbreviations: ['Lymph'], chart_unit: '%', upper_limit: 40.0, lower_limit: 20.0 },
  { parameter_name: 'monocytes', abbreviations: ['Mono'], chart_unit: '%', upper_limit: 10.0, lower_limit: 2.0 },
  { parameter_name: 'eosinophils', abbreviations: ['EO'], chart_unit: '%', upper_limit: 5.0, lower_limit: 1.0 },
  { parameter_name: 'basophils', abbreviations: ['BASO'], chart_unit: '%', upper_limit: 2.0, lower_limit: 0.5 },
  { parameter_name: 'mean_corpuscular_volume', abbreviations: ['MCV'], chart_unit: 'fL', upper_limit: 100.0,
    lower_limit: 80.0 },
  { parameter_name: 'platelet_distribution_width', abbreviations: ['PDW'], chart_unit: 'fL', upper_limit: 20.0,
    lower_limit: 9.0 },
  { parameter_name: 'mean_platelet_volume', abbreviations: ['MPV'], chart_unit: 'fL', upper_limit: 13.0, lower_limit: 7.0 }
].each do |parameter_attr|
  parameter = find_parameter(parameter_attr[:parameter_name])
  return Rails.logger.debug("ParameterMetadata #{parameter.parameter_name} already exists") if parameter.present?

  Admin::Hemigrams::ParameterMetadata.create(
    parameter_name: parameter_attr[:parameter_name],
    abbreviations: parameter_attr[:abbreviations],
    chart_unit: parameter_attr[:chart_unit],
    upper_limit: parameter_attr[:upper_limit],
    lower_limit: parameter_attr[:lower_limit]
  )
end
