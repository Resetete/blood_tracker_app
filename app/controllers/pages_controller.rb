# frozen_string_literal: true

# Controls the different sub pages
class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def imprint; end

  def news
    top_headline_news = Api::FetchNewsService.new(news_api_client).top_headline_news
    everything = Api::FetchNewsService.new(news_api_client).everything_news
    @all_news = (top_headline_news + everything).first(30)
  end

  def sort_news_articles
    sort_by = params[:sort_by]
    top_headline_news = Api::FetchNewsService.new(news_api_client).top_headline_news
    everything = Api::FetchNewsService.new(news_api_client).everything_news(sort_by: sort_by)
    sorted_news = (top_headline_news + everything).first(30)

    respond_to do |format|
      format.html { render partial: 'sorted_news', locals: { sorted_news: sorted_news } }
    end
  end
end
