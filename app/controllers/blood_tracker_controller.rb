class BloodTrackerController < ApplicationController
  skip_before_action :authenticate_user!

  def sitemap
    headers['Content-Type'] = 'application/xml'
    respond_to do |format|
      format.xml { render layout: false, content_type: 'text/xml' }
    end
  end
end
