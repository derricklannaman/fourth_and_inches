module ApplicationHelper

  def nav_view_by_login_status
    if user_signed_in?
      render 'layouts/top_nav_bar'
    else
      render 'layouts/general_navigation'
    end
  end


end
