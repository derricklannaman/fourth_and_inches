module TeamsHelper

  def show_team_name(team)
    if team.title.blank?
      "Name: * none *"
    else
      "Name: #{team.title}"
    end
  end

  def show_team_coach(team)
    u = User.find(team.head_coach)
    return u.last_name.capitalize
  end

end
