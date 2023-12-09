#!/usr/bin/env bash

# exit on error
set -o errexit

bundle install
# install packages
yarn add chartjs-plugin-annotation
# clean assets
bundle exec bin/rails assets:precompile
bundle exec bin/rails assets:clean
# bundle exec bin/rails db:reset DISABLE_DATABASE_ENVIRONMENT_CHECK=1
bundle exec bin/rails db:migrate
bundle exec bin/rails db:seed
