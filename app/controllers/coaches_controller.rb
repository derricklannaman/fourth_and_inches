class CoachesController < ApplicationController
  def coaches_corner
  end

  def index
    @head_coaches = User.get_head_coaches
  end
end
