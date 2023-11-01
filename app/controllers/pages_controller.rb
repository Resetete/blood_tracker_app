# frozen_string_literal: true

# Controls the different sub pages
class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def imprint; end

  def cookie_policy; end

  def news
    top_headline_news = Api::FetchNewsService.new(news_api_client).top_headline_news
    everything = Api::FetchNewsService.new(news_api_client).everything_news
    @news = (top_headline_news + everything).first(30)
  end

  def sort_news_articles
    sort_by = params[:sort_by]
    top_headline_news = Api::FetchNewsService.new(news_api_client).top_headline_news.first(3)
    everything = Api::FetchNewsService.new(news_api_client).everything_news(sort_by:)
    @news = (top_headline_news + everything).first(30) # .sort_by(&:publishedAt).reverse

    if @news
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('sorted_news_result', partial: 'pages/news', locals: { news: @news })
        end
      end
    else
      render news_path
    end
  end

  def glossary
    @glossary_entries = Admin::BloodCellDescription.all.sort_by(&:title)
  end
end
