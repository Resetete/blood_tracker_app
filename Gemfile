source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.0.4', '>= 7.0.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# psych 3 to fix incompatibility
gem 'psych', '~> 3'
# use postgres database
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# importmaps for javascript (instead of webpacker)
gem 'importmap-rails'
# Turbo makes navigating your web application faster.
gem 'turbo-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# authentication
gem 'stimulus-rails'
# to work with asset pipeline
gem "sprockets-rails"
gem 'devise'
# page pagination
gem 'will_paginate', '~> 3.1.0'
# add pagination component from materialize
gem 'will_paginate-materialize', git: 'https://github.com/mldoscar/will_paginate-materialize', branch: 'master'
# charts
gem 'groupdate'
gem 'chartkick'
gem 'highcharts-rails'
# Requests API
gem 'faraday'
# debugging
gem 'pry'
# convert xml to hash
gem 'ox'
# sanitize html from third party api
gem 'rails-html-sanitizer'

# frontend
gem 'foreman'
gem 'font-awesome-rails'
gem 'haml-rails', '~> 2.0'
gem 'html2haml'
gem 'bootstrap', '~> 5.1.3'

# unit converter
gem 'ruby-units'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  gem 'rails_12factor'
end
