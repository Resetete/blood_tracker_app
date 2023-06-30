# frozen_string_literal: true

module Api
  class FetchNewsService
    # retrieves global news from https://newsapi.org

    def initialize(news_api_client)
      @newsapi = news_api_client
    end

    def top_headline_news(q: 'blood', country: 'us')
      @top_headline_news ||= @newsapi.get_top_headlines(
        q:,
        category: 'health',
        language: 'en',
        country:
      )
    end

    def everything_news(q: 'blood AND (disease OR treatment)', from: Date.today - 1.month)
      @everything_news ||= @newsapi.get_everything(
        q:,
        from:,
        to: Date.today,
        language: 'en',
        sortBy: 'relevancy'
      )
    end

    def news_sources(country: 'us', language: 'en')
      @newsapi.get_sources(country:, language:)
    end
  end
end
