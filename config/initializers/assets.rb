# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'stylesheets', 'application.scss')
# add additional javascript files to the asset pipeline
Rails.application.config.assets.paths << Rails.root.join('vendor', 'javascript')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w[application.scss jquery.js chartjs-plugin-annotation.js]
