class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_current_program

  protected

  def get_current_program
    if current_user.nil?
      return
    else
      @program = current_user.program
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :username, :email, :password, :password_confirmation, :remember_me, :is_director, :is_head_coach) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  def get_divisions #REFACTOR: add to access arg to allow chaining
    current_user.program.divisions
  end

  def find_all_coaches
    id = current_user.program.id
    @head_coaches = User.where("user_type = 'head_coach' AND program_id =" + id.to_s)
  end

end
