module ApplicationHelper

  def calculate_account_balance
    "Balance: #{number_to_currency( current_user.account_balance )}"
  end

  def calculate_fee
    player_count = current_user.get_parents_players.count
    current_fee = current_user.formatted_fee
    return current_fee * player_count
  end

  def display_todays_date
    Time.now.strftime('%B %d, %Y')
  end

  def display_born_on(player)
    if player.date_of_birth.nil?
      "Add Date of birth"
    else
      player.date_of_birth.strftime('%B %d, %Y')
    end
  end

  def show_sign_out_if_signed_in
    if current_user.nil?
      return
    else
      render 'layouts/user_access_controls'
    end
  end

  def name
    "#{current_user.first_name} #{current_user.last_name}"
  end

  # /////// DISPLAY IMAGES

  def display_team_logo(size)
    if current_user.program.logo_image_content_type.nil? && current_user.user_type === 'director'
      link_to '<div id="logo-place-holder" >add logo</div>'.html_safe, logo_path(current_user.program.id)
    elsif current_user.program.logo_image_content_type.nil? && current_user.user_type === 'head_coach'
      return
    else
      image_tag @program.logo_image.url(size)
    end
  end

  def display_player_image(player)
    @player ||= @player = player
    if @player.avatar_updated_at.nil?
      image_tag('helmet.png', size: '250x250', class: 'player-image')
    else
      image_tag @player.avatar.url(:medium), class: 'player-image'
    end
  end

  def display_mini_player_image(player)
    if player.avatar_updated_at.nil?
      image_tag('helmet.png', class: 'mini-player-image')
    else
      image_tag(player.avatar.url(:thumb), class: 'mini-player-image')
    end
  end

  # //////////

  def display_team_title
    "#{current_user.program.town_name.capitalize} \
     #{current_user.program.team_name.capitalize} " + "Football"
  end

  def full_team_name
    "#{current_user.program.town_name.capitalize}
    #{current_user.program.team_name.capitalize} "
  end

  def team_name(team)
    @team.title
  end

  def team_player_belongs_to(player)
    if Team.exists?(player.team_id)
      Team.find(player.team_id).title
    end
  end

  def show_teams_division(team)
    div_id = team.division_id
    div_id.nil? ? "None on file" : Division.find(div_id).name
  end

  def nav_view_by_login_status
    if user_signed_in? && current_user.user_type != 'parent_user'
      render 'layouts/interior_nav_bar'
    elsif !user_signed_in? && (controller_name == 'websites' && action_name == 'show')
      render 'layouts/user_navigation'
    elsif user_signed_in? && current_user.user_type == 'parent_user'
      render 'layouts/user_navigation'
    else
      render 'layouts/exterior_nav_bar'
    end
  end

  def coach_side_navigation(controller_name, action_name)
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
      elsif (controller_name == 'home'   && action_name == 'features')
        dashboard_nav
      end
    end
  end

  def director_side_navigation(controller_name, action_name)
    if user_signed_in?
      if    (controller_name == 'dashboard' && action_name == 'show')
        # dashboard_nav
      elsif (controller_name == 'teams'     && action_name == 'index')
        main_director_panel
      elsif (controller_name == 'programs'  && action_name == 'index')
        main_director_panel
      elsif (controller_name == 'office'    && action_name == 'office_manager')
        office_mgr_nav
      elsif (controller_name == 'coaches'   && action_name == 'coaches_corner')
        coach_corner_nav
      elsif (controller_name == 'players'   && action_name == 'index')
        player_index_nav
      elsif (controller_name == 'home'   && action_name == 'features')
        dashboard_nav
      end
    end
  end

  def dashboard_nav
    render 'layouts/dashboard_nav_panel'
  end

  def team_mgr_nav
    render 'layouts/team_manager_navigation'
  end

  def main_director_panel
    render 'director_navigation/main_side_panel'
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
