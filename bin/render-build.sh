#!/usr/bin/env bash

# exit on error
set -o errexit
set -o pipefail

# install packages
echo "Install packages"
yarn install
bundle install

# install chartjs-plugin-annotation
echo "Install chartjs-plugin-annotation"
yarn add chartjs-plugin-annotation

# copy the package to the vendor directory
echo find path of chartjs-plugin-annotation.js
find . -type f -name "chartjs-plugin-annotation.js"
echo copy chartjs-plugin-annotation to the asset pipeline
cp vendor/javascript/chartjs-plugin-annotation.js app/assets/chartjs-plugin-annotation/

# clean and precompile assets
echo "Precompile assets"
bundle exec bin/rails assets:precompile RAILS_ENV=production
bundle exec bin/rails assets:clean

# run setup script
echo "Run setup script"
bin/setup

echo "Build script completed successfully"
