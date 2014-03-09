class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params[:team])
    @team.title = get_age_group(params[:age_group])
    @team.user_id = current_user.id
    if @team.save

      render :json => {team: @team}
    else
      render :text => "team not created"
    end

  end



  private

    def get_age_group(age_group)
      case age_group
      when "1"
        "7 Year Olds"
      when "2"
        "8 Year Olds"
      when "3"
        "9 Year Olds"
      when "4"
        "10 Year Olds"
      else
        "Players"
      end
    end


end
