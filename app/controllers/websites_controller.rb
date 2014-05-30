class WebsitesController < ApplicationController

  def show
    @website = Website.find(params[:id])
    # @website = current_user.program.websites.first
    @host = request.host
    @full_path = "#{root_url} #{@rel_path}"
  end


end
