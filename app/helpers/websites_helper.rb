module WebsitesHelper

  def show_sign_out_if_signed_in
    if current_user.nil?
      return
    else
      render 'layouts/user_access_controls'
    end
  end
end
