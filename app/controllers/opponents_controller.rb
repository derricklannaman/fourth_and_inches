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
    state = ' NY '
    add_address = "#{params[:opponent][:street] + ', ' +params[:opponent][:town] + state + params[:opponent][:zip]}"
    @opponent.address = add_address
    if @opponent.save
      redirect_to @opponent, notice: "#{@opponent.name} added."
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @hash = Gmaps4rails.build_markers(@opponent) do |opponent, marker|
      marker.lat opponent.latitude
      marker.lng opponent.longitude
      marker.infowindow "#{opponent.name + opponent.address}"
    end
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
      params.require(:opponent).permit(:name, :street, :town, :zip, :notes, :program_id, :team_id, :division, :latitude, :longitude, :address)
    end

    def find_opponent
      @opponent = Opponent.find(params[:id])
    end

end
