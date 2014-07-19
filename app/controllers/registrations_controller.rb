class RegistrationsController < Devise::RegistrationsController

  include UserRegistration

  def create
    if form_from_web_registration? && user_type_is_blank?
      process_website_registration
      save_user_or_show_new(resource)
    elsif user_type_is_present? && user_type_is_director?
      process_director_registration
      save_user_or_show_new(resource)
    elsif access_code_present?
      process_access_code_registration
      save_user_or_show_new(resource)
    end
  end


  protected

    def after_sign_up_path_for(resource)
      dashboard_path
    end

  private

    def user_params
      params.require(:user).permit( :first_name, :last_name, :password,
                          :password_confirmation, :user_type, :username, :email)
    end

end