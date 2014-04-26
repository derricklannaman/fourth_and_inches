class RegistrationsController < Devise::RegistrationsController

  # skip_before_filter :require_no_authentication

  def create
    if params[:user][:user_type].present?
      user_type = params[:user][:user_type]
      @user = User.new(user_params)
      binding.pry
      @user.user_type = user_type
        if @user.save
          sign_in_and_redirect resource
        else
          render :new
        end
    else
      flash[:notice] = "Please pick an user type."
      render :new
    end
  end


  protected

    def after_sign_up_path_for(resource)
      dashboard_path
    end


  private

    def user_params
      params.require(:user).permit( :password, :password_confirmation, :is_director, :user_type, :username,
        :email)
    end



end