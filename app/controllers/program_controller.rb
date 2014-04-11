class ProgramController < ApplicationController

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)
    @program.user_id = params[:user_id]
    if @program.save
      redirect_to @program
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
