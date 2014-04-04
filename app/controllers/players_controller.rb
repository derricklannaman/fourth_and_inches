class PlayersController < ApplicationController

  def index
    @players = current_user.teams.active.players
    @active_team = Team.active
  end

  def new
    @player = Player.new
    @active_team = Team.active
  end

  def create
    @player = Player.new(player_params)
    @player.team_id = params[:team_id]
    if @player.save
       redirect_to players_path, :notice => "player successfully created"
    else
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
    @active_team = Team.active
  end

  def update
    @player = Player.find(params[:id])
    @player.update(player_params)
    if @player.save
      redirect_to players_path, :notice => 'player successfully updated'
    else
      render :edit
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def destroy
    Player.find(params[:id]).destroy
      redirect_to players_path, :notice => 'player successfully deleted'
  end


  private

    def player_params
      params.require(:player)
              .permit(:first_name, :last_name, :address, :town, :zip, :age)
    end


end
