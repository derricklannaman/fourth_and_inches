class PlayersController < ApplicationController
  respond_to :html, :js
  def index
    @players = current_user.teams.active.players
    find_active_team
  end

  def new
    @player = Player.new
    find_active_team
  end

  def create
    @player = Player.new(player_params)
    @player.team_id = params[:team_id]
    if @player.save
       redirect_to team_manager_path, :notice => "player successfully created"
    else
      render :new
    end
  end

  def edit
    find_player
    find_active_team
  end

  def update
    find_player
    @player.update(player_params)
    if @player.save
      flash[:notice] = 'player successfully updated'
      redirect_to @player
    else
      render :edit
    end
  end

  def show
    @players = current_user.teams.active.players
    find_player
  end

  def destroy
    find_player

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

    def find_active_team
      @active_team = Team.active
    end

    def player_params
      params.require(:player)
              .permit(:first_name, :last_name, :address, :town, :zip, :age)
    end


end
