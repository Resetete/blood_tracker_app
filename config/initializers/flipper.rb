# frozen_string_literal: true

require_relative '../../app/models/flipper_feature'

# create descriptions for each feature flag and store them in flipper_features table
DESCRIPTIONS = {
  pricing_plan_plus: 'Configures the features that are allowed for users that are assigned to the Plus plan.',
  pricing_plan_diabetes_plus: 'Configures the features that are allowed for users that are assigned to the Diabetes Plus plan.',
  pricing_plan_plus_ai: 'Configures the features that are allowed for users that are assigned to the Plus plan.',
}.freeze

# this ensures that we only initialize after the table exists
if ActiveRecord::Base.connection.table_exists?('flipper_features')
  Flipper::UI.configure do |config|
    config.descriptions_source = lambda { |keys|
      # descriptions loaded from YAML file or database (postgres, mysql, etc)
      # return has to be hash of {String key => String description}
      FlipperFeature.where(key: keys).pluck(:key, :description).to_h
    }

    config.banner_text = "#{Rails.env.humanize} Environment"
    config.banner_class = Rails.env.development? ? 'info' : 'danger'

    DESCRIPTIONS.each do |key, description|
      feature = FlipperFeature.find_by(key:)

      next unless feature && feature.description.blank?

      feature.update(description:)
    end

    # Defaults to false. Set to true to show feature descriptions on the list
    # page as well as the view page.
    # store a description on a feature; in rails console: Flipper::Adapters::ActiveRecord::Feature.last.update(description: 'my description')
    config.show_feature_description_in_list = true

    # just for fun
    config.fun = true

    # Setting up groups that are controlled through feature flag
    # example:
    # Flipper.register(:plus_plan_users) do |actor|
    #   actor.is_a?(User) && actor.pricing_plan&.feature_enabled?(:pricing_plan_plus)
    # end
  end
end
