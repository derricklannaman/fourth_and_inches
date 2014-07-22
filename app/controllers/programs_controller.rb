class ProgramsController < ApplicationController

  def index
    @price_range = (150..300).step(25)
    @fee = @program.fee / 100
    get_website
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

  def edit
    @program = Program.find(params[:id])

  end

  def show
    @program = Program.find(params[:id])
    redirect_to(controller: "dashboard", action: "show" )
  end

  # def update
  # end

  def ajax_program_edits
    @program = Program.find(params[:id])
    @program.team_name = params['info']['team'].capitalize
    @program.town_name = params['info']['town'].capitalize
    if @program.save
      render json: @program
    else
      redirect_to(:back)
    end
  end

  def set_fee
    program = Program.find(params[:id])
    fee = params[:fee]
    calculate_stripe_fee(fee) # need $$ converted into cents for Stripe
    program.fee = @price_in_cents
    program.save
    new_fee = {
      fee: program.fee / 100
    }
    render :json => new_fee
  end


  private

    def program_params
      params.require(:program).permit(:town_name, :team_name, :league_name,
                                      :logo_image, :fee)
    end

end
