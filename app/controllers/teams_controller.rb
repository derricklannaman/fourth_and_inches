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
    @team.active = true
    group = params[:team][:age_group]
    @team.age_group = get_age_group(group) # TODO: clean up
    respond_to do |format|
      if @team.save
        # Displays the active/or last created team
        jumbotron_active_team(@team)

        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.js {}
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render 'new'}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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

  def staff
  end

private

  def team_params
    params.require(:team).permit(:title, :user_id, :age_group, :num_of_players)
  end

  def find_team
    @team = Team.find(params[:id])
  end

  def jumbotron_active_team(team)
    active_team_id = team.id
    all_actives = current_user.teams.where(active: true)
    all_actives.each do |t|
      unless t.id == active_team_id
        t.active = false
        t.save
      end
    end
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
