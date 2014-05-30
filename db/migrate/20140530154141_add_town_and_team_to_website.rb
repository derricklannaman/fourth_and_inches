class AddTownAndTeamToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :town, :string
    add_column :websites, :team, :string
  end
end
