class WebsitesController < ApplicationController

  def show
    @website = Website.friendly.find(params[:id])
    @name = @website.team.capitalize
  end


end
