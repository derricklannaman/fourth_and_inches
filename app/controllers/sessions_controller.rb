class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    sleep 3 # ensure that the session gets successfully destroyed per http://stackoverflow.com/questions/11676233/omniauth-facebook-does-not-always-logout-user
    redirect_to root_url
  end
end