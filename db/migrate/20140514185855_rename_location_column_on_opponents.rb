class RenameLocationColumnOnOpponents < ActiveRecord::Migration
  def change
    rename_column :opponents, :location, :notes
  end
end
