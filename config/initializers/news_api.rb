# frozen_string_literal: true

require 'news-api'

def news_api_client
  News.new(Rails.application.credentials.api.newsapi_key)
end
