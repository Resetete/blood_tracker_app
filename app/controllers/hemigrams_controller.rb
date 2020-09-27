class HemigramsController < ApplicationController

  def index
    @all_user_hemigrams = current_user.hemigrams
  end
end
