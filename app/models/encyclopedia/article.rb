# frozen_string_literal: true

require 'faraday'

module Encyclopedia
  # accesses the medlineplus API for a given term and returns the xml results article
  class Article
    # TODO: in controller only request new once a month
    # returns entries from https://medlineplus.gov/
    BASE_URL = 'https://wsearch.nlm.nih.gov/ws'

    attr_reader :article, :url, :source, :summary, :title

    def initialize(search_term)
      article = first_article_for(search_term)

      @article = article || nil
      @url = article.present? ? url_of(article) : nil
      @title = article.present? ? title_of(article) : nil
      @source = article.present? ? source_of(article) : nil
      @summary = article.present? ? summary_of(article) : nil
    end

    def first_article_for(search_term)
      articles = look_up(search_term)
      return if articles[:nlmSearchResult][:count] == '0'

      articles.dig(:nlmSearchResult, :list).second[:document]
    end

    def look_up(search_term)
      response = client.get('query', { db: 'healthTopics', term: search_term })

      xml_as_hash(response.body)
    rescue StandardError => e
      Rails.logger.error("An error occurred during the lookup: #{e.message}")
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
