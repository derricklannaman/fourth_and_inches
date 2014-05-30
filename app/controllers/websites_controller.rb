class WebsitesController < ApplicationController

  def show
    @website = Website.friendly.find(params[:id])
    @town = @website.town.capitalize
    @name = @website.team.capitalize
  end


end
