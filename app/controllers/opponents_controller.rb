class OpponentsController < ApplicationController

  before_action :find_opponent, only: [:edit, :show, :update, :destroy,
                                       :list_destroy]

  def new
    @opponent = Opponent.new
    @program_id = current_user.program.id
  end

  def create
    @opponent = Opponent.new(opponent_params)
    @opponent.program_id = params[:program_id]
    if @opponent.save
      redirect_to @opponent, notice: "#{@opponent.name} added."
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    @opponent.update(opponent_params)
    if @opponent.save
      redirect_to @opponent, notice: "#{@opponent.name} successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    @opponent.destroy
    redirect_to teams_path, notice: "#{@opponent.name} has been deleted."
  end

  def list_destroy
    @opponent.destroy
    render json: @opponent
  end


  private

    def opponent_params
      params.require(:opponent).permit(:name, :street, :town, :zip, :notes, :program_id, :team_id, :division)
    end

    def find_opponent
      @opponent = Opponent.find(params[:id])
    end

end
