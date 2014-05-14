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

  def edit
    @division = Division.find(params[:id])
  end

  def update
    @division = Division.find(params[:id])
    @division.update(division_params)
    if @division.save
      redirect_to teams_path, notice: 'division successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @division = Division.find(params[:id])
    division = { id: @division.id }
    @division.destroy
    render :json => {status: "ok"}
  end


  private

    def division_params
      params.require(:division).permit(:name, :age_group)
    end


end
