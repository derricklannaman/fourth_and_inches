class DashboardController < ApplicationController

  before_action :authenticate_user!
  layout :resolve_layout

  def new
  end

  def show
    @user = current_user
    @website = current_user.program.websites.first

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
