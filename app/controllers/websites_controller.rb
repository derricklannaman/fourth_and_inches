class WebsitesController < ApplicationController

  def show
    @name = current_user.program.team_name
    @website = Website.friendly.find(params[:id])
    # @website = current_user.program.websites.first
    @host = request.host
    @full_path = "#{root_url} #{@rel_path}"
  end


end
