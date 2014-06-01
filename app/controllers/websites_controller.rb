class WebsitesController < ApplicationController

  def show
    @website = Website.friendly.find(params[:id])
    @town = @website.town.capitalize
    @name = @website.team.capitalize
    @player = Player.new
    @user = User.new
# WIP: fix current_user if not signed in
    # unless !current_user.blank?
    #   @appointments = current_user.teams.active.schedules
    #   @appointments_by_date = @appointments.group_by(&:date)
    #   binding.pry
    #   @date = params[:date] ? Date.parse(params[:date]) : Date.today
    #   @team_id = current_user.teams
    # end

  end


end
