# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  address    :string(255)
#  town       :string(255)
#  zip        :string(255)
#  dob        :integer
#  team_id    :integer
#  parent_id  :integer
#  age        :integer
#  created_at :datetime
#  updated_at :datetime
#

class Player < ActiveRecord::Base
  has_many :users
  has_many :users, :through => :teams
  belongs_to :team

  has_attached_file :avatar, :styles => { :medium => "300x300>",
   :thumb => "100x100>" }, :bucket => 'fourthandinchesmedia',
   :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
