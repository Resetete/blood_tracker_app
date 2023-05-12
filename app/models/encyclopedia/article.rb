# frozen_string_literal: true

require 'faraday'

module Encyclopedia
  class Article
    # TODO: in controller only request new every 24h
    # returns entries from https://medlineplus.gov/
    BASE_URL = 'https://wsearch.nlm.nih.gov/ws'

    attr_reader :article, :url, :source, :summary, :title

    def initialize(search_term)
      article = first_article_for(search_term)

      @article = article
      @url = url_of(article)
      @title = title_of(article)
      @source = source_of(article)
      @summary = summary_of(article)
    end

    def first_article_for(search_term)
      articles = look_up(search_term)
      articles.dig(:nlmSearchResult, :list).second[:document]
    end

    def look_up(search_term)
      response = client.get('query', { db: 'healthTopics', term: search_term })
      xml_as_hash(response.body)
    end

    private

    def url_of(article)
      article.first[:url]
    end

    def title_of(article)
      parse_article_document(article).find { |hash| hash['title'] }.values.join
    end

    def source_of(article)
      parse_article_document(article).find { |hash| hash['organizationName'] }.values.join
    end

    def summary_of(article)
      parse_article_document(article).find { |hash| hash['FullSummary'] }.values.join
    end

    def parse_article_document(article)
      article.flat_map(&:values).map do |elem|
        { (elem.is_a?(String) ? elem : elem.first.values.join) => (elem.is_a?(String) ? nil : elem.second) }
      end
    end

    def client
      Faraday.new(
        url: BASE_URL,
        headers: { 'Content-Type' => 'application/xml' }
      )
    end

    def xml_as_hash(xml_body)
      Ox.load(xml_body, mode: :hash)
    end
  end
end
