class AddLogoImageToProgram < ActiveRecord::Migration
  def change
    add_column :programs, :logo_image, :string
  end
end
