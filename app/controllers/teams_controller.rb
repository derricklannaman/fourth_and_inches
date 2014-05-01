class TeamsController < ApplicationController

  # authorize_actions_for Team, :except => :team_manager, :show
  # authority_actions :team_manager => 'read'
  # authority_actions :team_manager => 'update'

  respond_to :html, :js

  def index
    @teams = current_user.program.teams
    @programs = current_user.program
    @divisions = get_divisions
  end

  def new
    @team = Team.new
    @user = current_user
    @divisions = current_user.program.divisions.pluck(:name)
    find_all_coaches
  end

  def create
    @team = Team.new(team_params)
    @team = load_team_attributes(@team)
    if @team.save
      add_team_cover(@team)
      redirect_to teams_path, notice: 'team added successfully'
    else
      flash[:notice] = @team.errors.full_messages.join (', ')
      render 'new'
    end
  end

  def edit
    find_team
    @divisions = get_divisions
    find_all_coaches
  end

  def show
    @active_team = Team.active
    @players = @active_team.players
    respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @active_team }
    end
  end

  def update
    find_team
    @team.update(team_params)
    find_and_add_division(@team)
    add_coach(@team)
    if @team.save
      redirect_to teams_path
    else
      render 'edit'
    end
  end

  def destroy
    find_team
    team = { id: @team.id, title: @team.title }
    @team.destroy
    render :json => {team: team}
  end

  def team_manager
    unless current_user.teams.empty?
      @players = current_user.teams.active.players
    end
    @team = Team.new
    @active_team = current_user.teams[0]
  end

private

  def team_params
    params.require(:team).permit(:title, :user_id, :division_id,
                                 :head_coach,  :num_of_players)
  end

  def find_team
    @team = Team.find(params[:id])
  end

  def add_coach(team)
    head_coach_id    = params[:team][:head_coach].to_i
    team.program_id  = current_user.program_id
    team.user_id     = head_coach_id
    team.head_coach  = head_coach_id
  end

  def find_and_add_division(team)
    div_info         = params[:team][:division]
    division         = Division.find_teams_divisions(div_info)
    team.division_id = division.first.id
    team.age_group   = division[0].age_group
  end

  def load_team_attributes(team)
    add_coach(team)
    team.active = true
    find_and_add_division(team)
    return team
  end

  def add_team_cover(team)
    team.players << Player.create(first_name: 'cover', last_name: 'team_'+ @team.id.to_s,
                                    team_id: @team.id)
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
