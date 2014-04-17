class CoachesController < ApplicationController
  def coaches_corner
  end

  def index
    @head_coaches = User.where(user_type: "head coach")
  end
end
