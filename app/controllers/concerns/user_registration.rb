module UserRegistration

  def save_user_or_show_new(resource)
    if @user.save
      sign_in_and_redirect resource
    else
      render :new
    end
  end

  def form_from_web_registration?
    params[:form_type] == 'web_sign_up'
  end

  def user_type_is_director?
    params[:user][:user_type] == 'director'
  end

  def access_code_present?
    params[:access].present?
  end

  def user_type_is_present?
    params[:user][:user_type].present?
  end

  def user_type_is_blank?
    params[:user][:user_type].blank?
  end

  def create_new_user
    @user = User.new(user_params)
  end

  def decifer_access_codes(parts)
    if @parts[1] == "1819055"
      @user.user_type = "staff"
    elsif @parts[1] == '7403214027'
      @user.user_type = "head_coach"
    end
  end

  def process_website_registration
    create_new_user
    site_id = params.fetch(:site_id)
    @user.user_type = 'parent_user'
    @user.program_id = params[:program_id]
  end

  def set_user_full_name
    @user_name = params[:user][:first_name] + '_' + params[:user][:last_name]
  end

  def process_director_registration
    create_new_user
    user_type = params[:user][:user_type]
    set_user_full_name
    @user.user_type = user_type
    @user.username = @user_name
  end

  def set_access_code_for_new_user
    @code.user_id = @user.id
    @code.save
  end

  def find_access_code_in_link
    @parts = params[:access].split('-')
    code_num = @parts[0]
    @id = @parts[2]
    @code = AccessCode.where(access_code: code_num)[0]
  end

  def process_access_code_registration
    create_new_user
    set_user_full_name
    find_access_code_in_link
    decifer_access_codes(@parts)
    set_access_code_for_new_user
    @user.program_id = @id
    @user.username = @user_name
  end
end