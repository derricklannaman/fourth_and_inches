class PlayersController < ApplicationController

  def index
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
       redirect_to player_path(@player)
    else
      render :new
    end
  end

  def show
    @player = Player.find(params[:id])
  end


  private

    def player_params
      params.require(:player)
              .permit(:first_name, :last_name, :address, :town, :zip, :age)
    end


end
