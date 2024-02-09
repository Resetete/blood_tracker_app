#!/usr/bin/env bash

# Set the environment to production
export RAILS_ENV=production

# exit on error
set -o errexit
set -o pipefail

# install packages
echo "Install packages"
yarn install
bundle install

# run setup script
# echo "Run setup script"
# only for first deployment
# bin/setup

# clean and precompile assets
echo "Precompile assets"
bundle exec bin/rails assets:precompile
bundle exec bin/rails assets:clean

# check status of migration
bin/rails db:migrate:status
bin/rails db:migrate

# seed the db
bundle exec bin/rails db:seed

echo "Build script completed successfully"
