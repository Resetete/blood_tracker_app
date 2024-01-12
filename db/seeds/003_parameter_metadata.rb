# frozen_string_literal: true

# Admin::Hemigrams::ParameterMetadata

def find_parameter(parameter_name)
  Admin::Hemigrams::ParameterMetadata.find_by(parameter_name:)
end

[
  { parameter_name: 'basophils', abbreviations: ['BASO'], chart_unit: '%', upper_limit: 1.2, lower_limit: 0.1 },
  { parameter_name: 'basophils_absolute_count', abbreviations: ['BASO'], chart_unit: '10^9/L', upper_limit: 0.3, lower_limit: 0.0 },
  { parameter_name: 'eosinophils', abbreviations: ['EOS'], chart_unit: '%', upper_limit: 7.0, lower_limit: 0.7 },
  { parameter_name: 'fibrinogen', abbreviations: ['-'], chart_unit: 'mg/dL', upper_limit: 400.0, lower_limit: 200.0 },
  { parameter_name: 'hematocrit', abbreviations: ['HCT'], chart_unit: '%', upper_limit: 52.0, lower_limit: 37.0 },
  { parameter_name: 'hemoglobin', abbreviations: %w[HB HGB], chart_unit: 'g/dL', upper_limit: 18.0, lower_limit: 12.0 },
  { parameter_name: 'lymphocytes', abbreviations: ['Lymph'], chart_unit: '%', upper_limit: 40.0, lower_limit: 20.0 },
  { parameter_name: 'lymphocytes_absolute_count', abbreviations: ['ALC'], chart_unit: '/nL', upper_limit: 3.6, lower_limit: 1.0 },
  { parameter_name: 'mean_corpuscular_hemoglobin', abbreviations: ['MCH'], chart_unit: 'pg', upper_limit: 34.0,
    lower_limit: 27.0 },
  { parameter_name: 'mean_corpuscular_hemoglobin_concentration', abbreviations: ['MCHC'], chart_unit: 'g/dL', upper_limit: 36.0,
    lower_limit: 32.0 },
  { parameter_name: 'mean_corpuscular_volume', abbreviations: ['MCV'], chart_unit: 'fL', upper_limit: 100.0,
    lower_limit: 80.0 },
  { parameter_name: 'mean_platelet_volume', abbreviations: ['MPV'], chart_unit: 'fL', upper_limit: 13.0, lower_limit: 7.0 },
  { parameter_name: 'monocytes', abbreviations: ['MONO'], chart_unit: '%', upper_limit: 10.0, lower_limit: 2.0 },
  { parameter_name: 'monocytes_absolute_count', abbreviations: ['MONO'], chart_unit: '10^9/L', upper_limit: 0.8, lower_limit: 0.2 },
  { parameter_name: 'neutrophils', abbreviations: %w[NEUT Neutro], chart_unit: '%', upper_limit: 70.0,
    lower_limit: 34.0 },
  { parameter_name: 'neutrophils_absolute_count', abbreviations: %w[NEUT Neutro], chart_unit: 'cells/μL', upper_limit: 8000.0,
    lower_limit: 1500.0 },
  { parameter_name: 'platelet_distribution_width', abbreviations: ['PDW'], chart_unit: 'fL', upper_limit: 20.0,
    lower_limit: 9.0 },
  { parameter_name: 'prothrombin_time', abbreviations: ['PT'], chart_unit: 'seconds', upper_limit: 15.0, lower_limit: 11.0 },
  { parameter_name: 'red_blood_cells', abbreviations: %w[RBC Erythrocytes], chart_unit: '10^6/μL', upper_limit: 6.0,
    lower_limit: 4.3 },
  { parameter_name: 'red_cell_distribution_width', abbreviations: ['RDW'], chart_unit: '%', upper_limit: 16.0,
    lower_limit: 11.0 },
  { parameter_name: 'thrombozythes', abbreviations: %w[PLT Thrombos], chart_unit: '10^9/L', upper_limit: 450.0,
    lower_limit: 150.0 },
  { parameter_name: 'white_blood_cells', abbreviations: %w[WBC Leukocytes], chart_unit: '10^6/μL', upper_limit: 11.0,
    lower_limit: 4.0 }
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
