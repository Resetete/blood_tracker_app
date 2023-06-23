module Api
  class FetchNewsService
    # retrieves global news from https://newsapi.org

    require 'news-api'

    def newsapi
      News.new(Rails.application.credentials.api.newsapi_key)
    end
  end
end