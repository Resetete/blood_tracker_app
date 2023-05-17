#!/usr/bin/env bash

# exit on error
set -o errexit

bundle install
bundle exec bin/rails assets:precomile
bundle exec bin/rails assets:clean
bundle exec bin/rails db:migrate
