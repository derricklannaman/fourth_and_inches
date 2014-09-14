class DashboardController < ApplicationController

  before_action :authenticate_user!
  layout :resolve_layout

  def new
  end

  def show
    # binding.pry
    @user = current_user
  end

  private

  def resolve_layout
    if current_user.has_role? 'master'
      "master"
    elsif current_user.has_role? 'head_coach'
      "application"
    end
  end

end
