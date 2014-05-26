class DashboardController < ApplicationController

  before_action :authenticate_user!
  layout :resolve_layout

  def new
  end

  def show
    @user = current_user
    # @program = current_user.program
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
