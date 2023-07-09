# frozen_string_literal: true

module Api
  # retrieves global news from https://newsapi.org

  class FetchNewsService
    # example response attributes
    #  @author="Thalia Beaty",
    #  @content=
    #   "Sage Chelf poses for a photo at her home in Orlando, Fla., May 27, 2023. Recent Florida legislation … [+6696 chars]",
    #  @description=
    #   "Florida legislation targets the LGBTQ+ community, including a law that curtails ...",
    #  @id="business-insider",
    #  @name="Business Insider",
    #  @publishedAt="2023-06-04T14:46:05Z",
    #  @title="Dozens of transgender people in Florida are crowdfunding to flee ...",
    #  @url="https://www.businessinsider.com/trans-people-in-florida-crowdfunding-to-flee-the-state-2023-6",
    #  @urlToImage="https://i.insider.com/647a612740bf000019fa197b?width=1200&format=jpeg">

    def initialize(news_api_client)
      @newsapi = news_api_client
    end

    def top_headline_news(q: 'blood', country: 'us')
      Rails.cache.fetch("top_headline_news_#{q}_#{country}", expires_in: 1.day) do
        @newsapi.get_top_headlines(
          q:,
          category: 'health',
          language: 'en',
          country:,
        )
      end
    rescue TooManyRequestsException => e
      Rails.logger.error("News API (top headlines) Too Many Requests Error: #{e.message}")
      []
    end

    def everything_news(q: 'blood AND (disease OR treatment)', from: Time.zone.today - 1.month, sort_by: 'relevancy')
      Rails.cache.fetch("everything_news_#{q}_#{from}_#{sort_by}", expires_in: 1.day) do
        @newsapi.get_everything(
          q:,
          from: from.to_s,
          to: Time.zone.today.to_s,
          language: 'en',
          sortBy: sort_by,
        )
      end
    rescue TooManyRequestsException => e
      Rails.logger.error("News API (everything news) Too Many Requests Error: #{e.message}")
      []
    end

    def news_sources(country: 'us', language: 'en')
      @newsapi.get_sources(country:, language:)
    end
  end
end
