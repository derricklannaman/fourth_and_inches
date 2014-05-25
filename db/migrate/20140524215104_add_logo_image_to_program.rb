class AddLogoImageToProgram < ActiveRecord::Migration

  def self.up
    add_attachment :programs, :logo_image
  end

  def self.down
    remove_attachment :programs, :logo_image
  end

end
