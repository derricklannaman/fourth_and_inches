class AddIndexToDashboard < ActiveRecord::Migration
  def change
    add_index :dashboards, :user_id
  end
end
