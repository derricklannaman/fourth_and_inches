class CreateOpponents < ActiveRecord::Migration
  def change
    create_table :opponents do |t|
      t.integer :program_id
      t.integer :team_id
      t.string :name
      t.text :location
      t.string :division
      t.index :team_id
      t.index :program_id

      t.timestamps
    end
  end
end
