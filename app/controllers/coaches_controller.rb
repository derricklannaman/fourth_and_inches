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
    binding.pry
    @coach = User.new(params)
  end




end
