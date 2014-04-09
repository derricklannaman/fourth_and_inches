class AddDirectorColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_director, :boolean
  end
end
