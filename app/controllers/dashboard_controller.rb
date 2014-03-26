class DashboardController < ApplicationController

  before_action :authenticate_user!

  def new
  end

  def show
    showActiveTeam
    @team = Team.new
    @teams = current_user.teams.three_most_recent
    @user = current_user
  end


private

  def showActiveTeam
    if Team.active.blank?
      @active_team = ""
    else
      @active_team = Team.active
    end
  end




end
