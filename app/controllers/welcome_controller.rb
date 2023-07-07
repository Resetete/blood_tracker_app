# frozen_string_literal: true

# Controls the landing page sections
class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # TODO: instead, allow user to query medline; ensure we cache the results
    # @thrombocytes_article = Encyclopedia::Article.new('platelet disorders')
    @blood_cell_descriptions = Admin::BloodCellDescription.all
    top_headline_news = Api::FetchNewsService.new(news_api_client).top_headline_news
    everything = Api::FetchNewsService.new(news_api_client).everything_news
    @all_news = (top_headline_news + everything).first(8)
  end
end
