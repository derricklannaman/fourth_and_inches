class DivisionsController < ApplicationController
  def index
    @divisions = get_divisions
  end

  def new
    @division = Division.new
    @program_id = current_user.program.id
    @program = current_user.program.team_name
  end


  def create
    @division = Division.new(division_params)
    @division.program_id = params[:program_id]
    if @division.save
      redirect_to(controller: 'dashboard', action: 'show')
    else
      render 'new'
    end
  end


  private

    def division_params
      params.require(:division).permit(:name, :age_group)
    end


end
