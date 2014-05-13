class OpponentsController < ApplicationController
  def new
    @opponent = Opponent.new
    @program_id = current_user.program.id
  end

  def edit

  end

  def show
  end
end
