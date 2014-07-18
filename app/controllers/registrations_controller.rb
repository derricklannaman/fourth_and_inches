class RegistrationsController < Devise::RegistrationsController

  # skip_before_filter :require_no_authentication

  def create
    if params[:form_type] == 'web_sign_up' && params[:user][:user_type].blank?
      process_website_registration
      if @user.save
        sign_in_and_redirect @user
      else
        render :new
      end
    elsif params[:user][:user_type].present? && params[:user][:user_type] == 'director'
      process_director_registration
        if @user.save
          sign_in_and_redirect resource
        else
          render :new, notice: "Please pick an user type"
        end
    elsif params[:access].present?
      @user = User.new(user_params)
      parts = params[:access].split('-')
      code_num = parts[0]                 # Find access code decifer
      id = parts[2]                       # Find program id
      code = AccessCode.where(access_code: code_num)[0]
      if parts[1] == "1819055"
        @user.user_type = "staff"
      elsif parts[1] == '7403214027'
        @user.user_type = "head_coach"
      end
      @user.program_id = id
      @user.username = user_name
      if @user.save
        code.user_id = @user.id # Set access code to new user if saved
        code.save
        # TODO: post a confirmation that a coach signed up to directors' activity feed
        sign_in_and_redirect resource
      else
        puts ">>>>>>#{@user.errors.full_messages}<<<<"
        flash[:error] = @user.errors.full_messages
        render :new
      end
    end
  end


  protected

    def after_sign_up_path_for(resource)
      dashboard_path
    end

    def process_website_registration
      site_id = params.fetch(:site_id)
      @user = User.new(user_params)
      @user.user_type = 'parent_user'
      @user.program_id = params[:program_id]
    end

    def process_director_registration
      @user = User.new(user_params)
      user_type = params[:user][:user_type]
      user_name = params[:user][:first_name] + '_' + params[:user][:last_name]
      @user.user_type = user_type
      @user.username = user_name
    end


  private

    def user_params
      params.require(:user).permit( :first_name, :last_name, :password,
                          :password_confirmation, :user_type, :username, :email)
    end



end