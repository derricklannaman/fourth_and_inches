class TeamsController < ApplicationController



  def index
    @teams = current_user.teams.most_recent_first
  end

  def new
    @team = Team.new
    @user = current_user
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id
    group = params[:team][:age_group]
    @team.age_group = get_age_group(group) # TODO: clean up
    if @team.save
      redirect_to @team
    else
      render 'new'
    end
  end

  def edit
    find_team
  end

  def show
    find_team
  end

  def update
    find_team
    @team.update(team_params)
    group = params[:team][:age_group]
    @team.age_group = get_age_group(group) # TODO: clean up
    if @team.save
      flash[:notice] = "Team successfully updated"
      redirect_to team_path @team
    else
      render 'edit'
    end
  end

  def destroy
    find_team.destroy
    redirect_to dashboard_path
  end



private

  def team_params
    params.require(:team).permit(:title, :user_id, :age_group, :num_of_players)
  end

  def find_team
    @team = Team.find(params[:id])
  end


# TODO: remove hardcoded youth options once director model and program is
# created...and correct in controllers
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
