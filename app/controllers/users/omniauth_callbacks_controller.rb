class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"])
    @user.user_type = 'director'
    if @user.persisted?

      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_registration_url
    end
  end


  def after_sign_up_path_for(resource)
    dashboard_path
  end

end