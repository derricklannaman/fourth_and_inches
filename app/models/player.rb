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

  has_many :users, :through => :teams
  # has_and_belongs_to_many :teams
end
