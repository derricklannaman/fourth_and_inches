class DashboardController < ApplicationController

  before_action :authenticate_user!
  layout :resolve_layout

  def new
  end

  def show
    @teams = current_user.teams.three_most_recent
    @user = current_user
  end

  private

  def resolve_layout
    if current_user.has_role? 'director'
      "director"
    elsif current_user.has_role? 'head_coach'
      "application"
    end
  end

end
