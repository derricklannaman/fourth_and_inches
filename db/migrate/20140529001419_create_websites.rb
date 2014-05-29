class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :program_url
      t.integer :program_id
      t.index :program_id
      t.timestamps
    end
  end
end
