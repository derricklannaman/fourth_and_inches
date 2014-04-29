module TeamsHelper

  def show_team_name(team)
    if team.title.blank?
      "Name: * none *"
    else
      "Name: #{team.title}"
    end
  end

end
