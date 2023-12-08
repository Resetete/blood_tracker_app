# frozen_string_literal: true

# Controls the landing page sections
class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if mediline_search_params.present?
      query = sanitize_search_query(mediline_search_params[:mediline_search])
      begin
        search_result = Encyclopedia::Article.new(query)
        @mediline_search_result = search_result.article.present? ? search_result : false
      rescue StandardError => e
        @error_message = ErrorHandling::LOOK_UP_ERROR_MESSAGE
      end
    end
    @blood_cell_descriptions = Admin::BloodCellDescription.on_landing_page.sort_by(&:title)
    top_headline_news = Api::FetchNewsService.new(news_api_client).top_headline_news
    everything = Api::FetchNewsService.new(news_api_client).everything_news
    @all_news = (top_headline_news + everything).reject { |news| news.title.downcase.include?('removed') }.uniq(&:title).first(9)
  end

  private

  def mediline_search_params
    params.permit(:mediline_search)
  end
end
