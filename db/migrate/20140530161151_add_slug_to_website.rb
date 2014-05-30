class AddSlugToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :slug, :string
  end

end
