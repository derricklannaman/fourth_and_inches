class OpponentsController < ApplicationController

  # before_action :find_opponent, only: [:create, :show]

  def new
    @opponent = Opponent.new
    @program_id = current_user.program.id
  end

  def create
    @opponent = Opponent.new(opponent_params)
    if @opponent.save
      redirect_to teams_path, notice: "opponent added"
    else
      render 'new'
    end
  end

  def edit
    @opponent = Opponent.find(params[:id])
  end

  def show
  end


  private

    def opponent_params
      params.require(:opponent).permit(:name, :location, :program_id,
                                        :team_id, :division)
    end




end
