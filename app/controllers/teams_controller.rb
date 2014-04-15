class TeamsController < ApplicationController

  authorize_actions_for(Team)
  authority_actions :team_manager => 'read'

  respond_to :html, :js

  def index
    @teams = current_user.teams
    @programs = current_user.program
    @divisions = current_user.program.divisions #REFACTOR: add model scope
  end

  def new
    @team = Team.new
    @user = current_user
    @divisions = current_user.program.divisions.pluck(:name) #REFACTOR: add model scope
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id
    @team.program_id = current_user.program_id
    @team.active = true
    division = Division.where(name: params[:team][:division]) #REFACTOR: add model scope
    @team.division_id = division.first.id #REFACTOR: add model scope
    @team.age_group = division[0].age_group
      if @team.save
        jumbotron_active_team(@team)
        redirect_to team_manager_path
      else
        flash[:notice] = @team.errors.full_messages.join (', ')
        render 'new'
      end
  end


  def edit
    find_team
  end

  def show
    @active_team = Team.active

    respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @active_team }
  end



  end

  def update
    find_team
    @team.update(team_params)
    # group = params[:team][:age_group]
    # @team.age_group = get_age_group(group) # TODO: clean up
    if @team.save
      flash[:notice] = "Team successfully updated"
      redirect_to team_manager_path
    else
      render 'edit'
    end
  end

  def destroy
    find_team
    team = { id: @team.id, title: @team.title }
    flash[:notice] = "Team successfully deleted"
    @team.destroy
    render :json => {team: team}
  end

  def staff
  end

  def schedule_manager
  end

  def team_manager

    @players = current_user.teams.active.players unless current_user.teams.empty?
    @team = Team.new
    @active_team = Team.active
    # authorize_action_for(@team)
  end

private

  def team_params
    params.require(:team).permit(:title, :user_id, :division_id, :num_of_players)
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

end
