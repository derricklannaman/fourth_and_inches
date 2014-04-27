class CoachesController < ApplicationController
  def coaches_corner
  end

  def index
    find_all_coaches
  end

  def new
    @coach = User.new()
  end

  def create
    parts = params[:access].split('-')

    @coach = User.new() # Set coach attr individually
    @coach.first_name = params[:user][:first_name]
    @coach.last_name = params[:user][:last_name]
    @coach.username = params[:user][:username]
    @coach.username = params[:user][:username]
    @coach.email = params[:user][:email]
    @coach.password_confirmation = params[:user][:password_confirmation]

    @coach.user_type = "head_coach"
    @coach.program_id = parts[2]

    code_num = parts[0] # Find access code
    code = AccessCode.where(access_code: code_num)[0]
    # binding.pry
      if @coach.save
        code.user_id = @coach.user_id # Set access code to new coach if saved
        code.save
        # binding.pry
        redirect_to dashboard_path
      else
        # binding.pry
        flash[:notice] = @coach.errors.full_messages
        render :new
      end
  end

end
