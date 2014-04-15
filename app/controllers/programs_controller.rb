class ProgramsController < ApplicationController

  def index
    @programs = current_user.program
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)
    user = User.find(params[:user_id])
    if @program.save
      user.program_id = @program.id
      user.save
      # redirect_to @program
      redirect_to(controller: 'divisions', action: 'new')
    else
      flash.notice = @program.errors.full_message.join(' ')
      render :new
    end
  end

  def show
    @program = Program.find(params[:id])
    redirect_to(controller: "dashboard", action: "show" )
  end


  private

    def program_params
      params.require(:program).permit(:town_name, :team_name, :league_name)
    end

end
