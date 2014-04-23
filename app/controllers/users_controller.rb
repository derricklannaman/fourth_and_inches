class UsersController < ApplicationController

  def index
    @users = User.all
    find_all_coaches
  end

  def new
    @user = User.new()
  end



end
