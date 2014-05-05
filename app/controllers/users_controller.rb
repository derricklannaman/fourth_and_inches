class UsersController < ApplicationController

  def index
    @users = User.all
    find_all_coaches
    @staff = User.where(user_type: "staff") #TODO:REFACTOR
  end

  def new
    @user = User.new()
  end

  def edit
    find_user
  end

  def show
    find_user
  end

  def update
    find_user
    @user.update(user_params)
    if @user.save
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    find_user
    # @user.destroy
    redirect_to users_path
  end


  private

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit( :first_name, :last_name, :username, :email)
    end



end
