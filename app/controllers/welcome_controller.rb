# frozen_string_literal: true

class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @thrombocytes_article = Encyclopedia::Article.new('platelet disorders')
    @lymphocyte_article = Encyclopedia::Article.new('lymphocyte')
  end
end
