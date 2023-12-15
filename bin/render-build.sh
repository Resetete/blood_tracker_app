#!/usr/bin/env bash

# exit on error
set -o errexit

bundle install
# install packages
echo install chartjs-plugin-annotation
yarn add chartjs-plugin-annotation
# clean assets
echo precompile and clean assets
bundle exec bin/rails assets:precompile
bundle exec bin/rails assets:clean
# bundle exec bin/rails db:reset DISABLE_DATABASE_ENVIRONMENT_CHECK=1
echo run db:migrate
bundle exec bin/rails db:migrate
echo run db:seed
bundle exec bin/rails db:seed
