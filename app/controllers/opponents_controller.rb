class OpponentsController < ApplicationController

  # before_action :find_opponent, only: [:create, :show]

  def new
    @opponent = Opponent.new
    @program_id = current_user.program.id
  end

  def create
    @opponent = Opponent.new(opponent_params)
    if @opponent.save
      redirect_to @opponent, notice: "#{@opponent.name} added."
    else
      render 'new'
    end
  end

  def edit
    @opponent = Opponent.find(params[:id])
  end

  def show
    @opponent = Opponent.find(params[:id])
  end

  def update
    @opponent = Opponent.find(params[:id])
    @opponent.update(opponent_params)
    if @opponent.save
      redirect_to @opponent, notice: "#{@opponent.name} successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    @opponent = Opponent.find(params[:id])
    @opponent.destroy
    redirect_to teams_path, notice: "#{@opponent.name} has been deleted."
  end

  def list_destroy
    @opponent = Opponent.find(params[:id])
    @opponent.destroy
    render json: @opponent
  end


  private

    def opponent_params
      params.require(:opponent).permit(:name, :street, :town, :zip, :notes,
                                       :program_id,:team_id, :division)
    end

end
