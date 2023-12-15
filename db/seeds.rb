# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Or run Rails.application.load_seed in rails console

Dir[Rails.root.join('db', 'seeds', '*.rb')].sort.each do |file|
  load file
end

def find_parameter(parameter_name)
  Admin::Hemigrams::ParameterMetadata.find_by(parameter_name:)
end
