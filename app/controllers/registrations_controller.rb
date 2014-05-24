class RegistrationsController < Devise::RegistrationsController

  # skip_before_filter :require_no_authentication

  def create
    if params[:user][:user_type].nil?
      flash[:error] = "Please select Director to create a Football Program!"
      redirect_to new_user_registration_path
    elsif params[:user][:user_type].present?
      @user = User.new(user_params)
      user_type = params[:user][:user_type]
      @user.user_type = user_type
        if @user.save
          sign_in_and_redirect resource
        else
          render :new, notice: "Please pick an user type"
        end
    elsif params[:access].present?
      @user = User.new(user_params)
      parts = params[:access].split('-')
      code_num = parts[0]                 # Find access code
      id = parts[2]                       # Find program id
      code = AccessCode.where(access_code: code_num)[0]
      if parts[1] == "1819055"
        @user.user_type = "staff"
      elsif parts[1] == '7403214027'
        @user.user_type = "head_coach"
      end
      @user.program_id = id
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


  private

    def user_params
      params.require(:user).permit( :first_name, :last_name, :password, :password_confirmation, :user_type, :username,
        :email)
    end



end