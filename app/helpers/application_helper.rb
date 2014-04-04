module ApplicationHelper

  def nav_view_by_login_status
    if user_signed_in?
      render 'layouts/interior_nav_bar'
    else
      render 'layouts/exterior_nav_bar'
    end
  end

  def change_navigation_layout(controller_name, action_name)
    if user_signed_in?
      if    (controller_name == 'dashboard' && action_name == 'show')
        dashboard_nav
      elsif (controller_name == 'teams'     && action_name == 'team_manager')
        team_mgr_nav
      elsif (controller_name == 'schedule'  && action_name == 'schedule_manager')
        schedule_mgr_nav
      elsif (controller_name == 'office'    && action_name == 'office_manager')
        office_mgr_nav
      elsif (controller_name == 'coaches'   && action_name == 'coaches_corner')
        coach_corner_nav
      elsif (controller_name == 'players'   && action_name == 'index')
        player_index_nav
      end
    end
  end

  def dashboard_nav
    render 'layouts/dashboard_nav_panel'
  end

  def team_mgr_nav
    render 'layouts/team_manager_navigation'
  end

  def schedule_mgr_nav
    render 'layouts/dashboard_nav_panel'
  end

  def office_mgr_nav
    render 'layouts/dashboard_nav_panel'
  end

  def coach_corner_nav
    render 'layouts/dashboard_nav_panel'
  end

  def player_index_nav
    render 'layouts/dashboard_nav_panel'
  end


  def footer_nav
    render 'layouts/dashboard_nav_panel'
  end


end
