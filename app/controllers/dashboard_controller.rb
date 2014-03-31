class DashboardController < ApplicationController

  before_action :authenticate_user!

  def new
  end

  def show
    # @active_team = Team.showActiveTeam
    # @team = Team.new
    @teams = current_user.teams.three_most_recent
    @user = current_user
  end


private


end
