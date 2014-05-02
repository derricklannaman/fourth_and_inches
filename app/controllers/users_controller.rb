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

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to users_path
    else
      render :edit
    end
  end


  private

    def user_params
      params.require(:user).permit( :first_name, :last_name, :username, :email)
    end



end
