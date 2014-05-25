class ProgramsController < ApplicationController

  def index
    @programs = current_user.program
    @program = Program.new
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)
    user = User.find(params[:user_id]) unless params[:user_id].nil?
    @program.name = @program.team_name
    if @program.save
      if !user.blank?
         user.program_id = @program.id
         user.save
         redirect_to(controller: 'divisions', action: 'new')
      else
        redirect_to(:back)
      end

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
      params.require(:program).permit(:town_name, :team_name, :league_name,
                                      :logo_image)
    end

end
