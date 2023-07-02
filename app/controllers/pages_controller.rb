# frozen_string_literal: true

# Controls the different sub pages
class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def imprint; end

  def blog
    top_headline_news = Api::FetchNewsService.new(news_api_client).top_headline_news
    everything = Api::FetchNewsService.new(news_api_client).everything_news
    @all_news = (top_headline_news + everything).first(30)
  end
end
