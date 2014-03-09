# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  player_id  :integer
#

class Team < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :players
end
