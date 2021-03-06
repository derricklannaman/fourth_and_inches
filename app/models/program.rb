# == Schema Information
#
# Table name: programs
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  league_name             :string(255)
#  town_name               :string(255)
#  team_name               :string(255)
#  logo_image_file_name    :string(255)
#  logo_image_content_type :string(255)
#  logo_image_file_size    :integer
#  logo_image_updated_at   :datetime
#  fee                     :decimal(30, 2)   default(0.0)
#

class Program < ActiveRecord::Base

  include Rails.application.routes.url_helpers

  has_many :users, dependent: :destroy
  has_many :players, dependent: :destroy
  has_many :access_codes, dependent: :destroy
  has_many :teams, dependent: :destroy
  has_many :divisions, dependent: :destroy
  has_many :opponents, dependent: :destroy
  has_many :websites, dependent: :destroy

  after_create :create_default_website

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :logo_image, styles: {
    mini: '50x50>',
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }, :bucket => 'fourthandinchesmedia'

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :logo_image, :content_type => /\Aimage\/.*\Z/

end

# def show_app_url
#   host = Rails.application.config.action_mailer.default_url_options[:host]
#   programs_url(@program)
# end

def create_default_website
  Website.create(program_id: self.id, town: self.town_name, \
    team: self.team_name, program_url: "#{self.town_name + '/' + self.team_name}")
end


def self.team_name
  # if self.nil? return
  self.name = "#{self.town_name + ' ' + self.team_name}"
  self.save
end






