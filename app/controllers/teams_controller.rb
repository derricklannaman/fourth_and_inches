class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    age_group = params[:team][:ag]
    num = params[:team][:pn].to_i

    @team.title = get_age_group(age_group)
    @team.user_id = current_user.id

      if @team.save
        players = autocreate_players(num, @team.id)

        # binding.pry
        team_template = {
          team_shell: @team,
          players_shell: players
        }
        render json: { team_info: team_template }
      else
        render :new
      end
  end



  private

    def team_params
      params.require(:team).permit(:title, :team, :user_id)
    end

    def autocreate_players(num, id)
      list = []
      num.times do
        list << Player.create(team_id: id)
      end
      return list
    end

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
