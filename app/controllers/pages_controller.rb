# frozen_string_literal: true

# Controls the different sub pages
class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def about; end
end
