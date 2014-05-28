class PlayersController < ApplicationController

  before_action :find_player, only: [:edit, :update, :show, :destroy]
  after_action :capitalize_name, only: [:create, :update]
  respond_to :html, :js

  def index
    @players = current_user.teams.active.players \
                          unless current_user.user_type == 'director'
    all_players = Player.order('last_name ASC')
    @all_players = all_players.delete_if { |p| p.first_name == 'cover' }
    find_active_team
  end

  def new
    @player = Player.new
    find_active_team
  end

  def create
    @player = Player.new(player_params)
    team = Team.find(params[:team_id])
    @player.team_id = team.id
    cover = check_for_team_cover(team)
    if @player.save
      calculate_age(@player)
      team.num_of_players.nil? ? team.num_of_players = 1 : team.num_of_players += 1
      team.save
     team.players.unshift(cover)
     redirect_to team_manager_path, :notice => "player successfully added"
    else
      render :new
    end
  end

  def edit
    find_active_team
  end

  def update
    @player.update(player_params)
    calculate_age(@player)
    if @player.save
      flash[:notice] = 'player successfully updated'
      redirect_to @player
    else
      render :edit
    end
  end

  def show
    # @players = current_user.teams.active.players
    find_player
  end

  def destroy

    # respond_to do |format|
    #   format.html { redirect_to @player }
    #   # format.js {}
    #   # format.json  { render json: @player}
    # end


    # .destroy

    # render json: @player
  end


  private

    def find_player
      @player = Player.find(params[:id])
    end

    def find_team
      Team.find(params[:team_id])
    end

    def find_active_team
      @active_team = current_user.teams.first
    end

    def capitalize_name
      @player.last_name = params[:player][:last_name].capitalize
      @player.save
    end

    def check_for_team_cover(team)
      if (team.players[0].first_name == 'cover') && \
         (team.players[0].last_name == 'team_'+ team.id.to_s)
        team.players.shift
      end
    end

    def calculate_age(player)
      bday = player.date_of_birth.to_date
      player.age = (Date.today - bday).to_i / 365
      player.save
    end

    def player_params
      params.require(:player)
              .permit(:first_name, :last_name, :address, :town, :zip, :age,
                      :avatar, :date_of_birth)
    end


end
