class RemoveIsDirectorAndIsHeadCoachFromUser < ActiveRecord::Migration
  def change
    removeColumn :users, :is_director
    removeColumn :users, :is_head_coach
  end
end
