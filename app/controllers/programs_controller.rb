class ProgramsController < ApplicationController

  def index
    @price_range = (150..300).step(25)
  end

  def new
    @program = Program.new
  end


  def create
    @program = Program.new(program_params)
    user = User.find(params[:user_id])
    @program.name = @program.team_name
    if @program.save
      user.program_id = @program.id
      user.save
      redirect_to(controller: 'divisions', action: 'new')
    else
      flash.notice = @program.errors.full_message.join(' ')
      render :new
    end
  end

  # def create
  #   @program = Program.new(program_params)
  #   # user = User.find(params[:user_id]) unless params[:user_id].nil?
  #   @program.name = @program.team_name
  #   if @program.save
  #     if !user.blank?
  #        user.program_id = @program.id
  #        user.save
  #        redirect_to(controller: 'divisions', action: 'new')
  #     else
  #       redirect_to(:back)
  #     end

  #   else
  #     flash.notice = @program.errors.full_message.join(' ')
  #     render :new
  #   end
  # end

  def edit
    @program = Program.find(params[:id])

  end

  def show
    @program = Program.find(params[:id])
    redirect_to(controller: "dashboard", action: "show" )
  end

  def update
    @program = Program.find(params[:id])
    @program.update(program_params)
    if @program.save
      redirect_to programs_path
    else
      render :logo
    end
  end

  def logo
    @program = Program.find(params[:id])
  end

  def set_fee
    program = Program.find(params[:id])
    program.fee = fee = params[:fee]
    program.save
    new_fee = {
      fee: program.fee
    }
    render :json => new_fee
  end


  private

    def program_params
      params.require(:program).permit(:town_name, :team_name, :league_name,
                                      :logo_image, :fee)
    end

end
