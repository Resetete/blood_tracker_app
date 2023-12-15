#!/usr/bin/env bash

# exit on error
set -o errexit
set -o pipefail

# install packages
echo "Install packages"
yarn install
bundle install

# clean and precompile assets
echo "Precompile assets"
bundle exec bin/rails assets:precompile
bundle exec bin/rails assets:clean

# seed the db
bundle exec bin/rails db:seed

# run setup script
echo "Run setup script"
bin/setup

echo "Build script completed successfully"
