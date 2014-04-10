class RemoveIsDirectorAndIsHeadCoachAgainFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :is_director
    remove_column :users, :is_head_coach
  end
end
