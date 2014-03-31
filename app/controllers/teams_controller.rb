class TeamsController < ApplicationController

  def index
    @team = Team.new
    @active_team = Team.showActiveTeam
  end

  def new
    @team = Team.new
    @user = current_user
  end

  # def create
  #   @team = Team.new(team_params)
  #   @team.user_id = current_user.id
  #   @team.active = true
  #   group = params[:team][:age_group]
  #   @team.age_group = get_age_group(group) # TODO: clean up
  #   # respond_to do |format|
  #     if @team.save
  #       # Displays the active/or last created team
  #       jumbotron_active_team(@team)

  #       binding.pry

  #       format.html { redirect_to @team, notice: 'Team was successfully created.' }
  #       format.js {}
  #       format.json { render json: @team, status: :created, location: @team }
  #     else
  #       format.html { render 'new'}
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   # end
  # end

  def create
    # binding.pry
    @team = Team.new(team_params)
    @team.user_id = current_user.id
    @team.active = true
    # binding.pry
    group = params[:team][:age]
    @team.age_group = get_age_group(group) # TODO: clean up
  # binding.pry

      if @team.save
        jumbotron_active_team(@team)
        team = {
          name: @team.title,
          group: @team.age_group,
          num: @team.num_of_players
        }
        render json: { team_info: team}
        # binding.pry
        # render :json => { story: story}
      else
        # flash[:notice] = @team.errors.full_messages
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
    find_team
    # respond_to do |format|

    # end



    team = { id: @team.id, title: @team.title }
    flash[:notice] = "Team successfully deleted"
    @team.destroy
    render :json => {team: team}
  end

  def staff
  end

  def schedule_manager
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
