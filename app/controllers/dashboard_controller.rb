class DashboardController < ApplicationController

  before_action :authenticate_user!

  def new
  end

  def show
    @current_user = current_user
  end

end
