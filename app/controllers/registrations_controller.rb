class RegistrationsController < Devise::RegistrationsController


  def create

    if params[:user][:is_director] == "true"
      @user = User.new(user_params)
      @user.is_director = true
      if @user.save
        # binding.pry
        redirect_to(controller: "dashboard", action: "show")
      else
        render :new
      end
    elsif params[:user][:is_head_coach] == "true"
      @user = User.new(user_params)

    end
  end


  private

    def user_params
      params.require(:user).permit( :password, :password_confirmation, :is_director, :is_head_coach, :username,
        :email )

    end


end