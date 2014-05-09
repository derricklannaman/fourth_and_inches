class RenameTypeColumnOnScheduleTable < ActiveRecord::Migration
  def change
    rename_column :schedules, :type, :entry_type
  end
end
