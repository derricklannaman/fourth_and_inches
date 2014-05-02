class UsersController < ApplicationController

  def index
    @users = User.all
    find_all_coaches
    @staff = User.where(user_type: "staff")
  end

  def new
    @user = User.new()
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end



end
