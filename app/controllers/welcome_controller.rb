# frozen_string_literal: true

# Controls the landing page sections
class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # @thrombocytes_article = Encyclopedia::Article.new('platelet disorders') # instead this, allow user to query medline
    @blood_cell_descriptions = BloodCellDescription.all
  end
end
