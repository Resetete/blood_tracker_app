# frozen_string_literal: true

# create descriptions for each feature flag and store them in flipper_features table
DESCRIPTIONS = {
  pricing_plan_plus: 'Configures the features that are allowed for users that are assigned to the Plus plan.',
  pricing_plan_plus_ai: 'Configures the features that are allowed for users that are assigned to the Plus plan.'
}.freeze

DESCRIPTIONS.each do |key, description|
  feature = Flipper::Adapters::ActiveRecord::Feature.find_by(key:)

  next unless feature && feature.description.blank?

  feature.update(description:)
end

Flipper::UI.configure do |config|
  config.descriptions_source = lambda { |keys|
    # descriptions loaded from YAML file or database (postgres, mysql, etc)
    # return has to be hash of {String key => String description}
    Flipper::Adapters::ActiveRecord::Feature
      .where(key: keys)
      .pluck(:key, :description)
      .to_h
  }

  config.banner_text = "#{Rails.env.humanize} Environment"
  config.banner_class = Rails.env.development? ? 'info' : 'danger'

  # Defaults to false. Set to true to show feature descriptions on the list
  # page as well as the view page.
  # store a description on a feature; in rails console: Flipper::Adapters::ActiveRecord::Feature.last.update(description: 'my description')
  config.show_feature_description_in_list = true

  # just for fun
  config.fun = true
end
