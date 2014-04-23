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
    # binding.pry
    @division = Division.new(division_params)
    @division.program_id = params[:program_id]
    if @division.save
      # if add another button was clicked, go back to page
      if params.has_value? "add more"
        redirect_to :back, notice: 'Please add another division.'
      else
        redirect_to(controller: 'dashboard', action: 'show')
      end
    else
      render 'new'
    end
  end


  private

    def division_params
      params.require(:division).permit(:name, :age_group)
    end


end
