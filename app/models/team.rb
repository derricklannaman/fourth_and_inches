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

  scope :most_recent_first, lambda { order('created_at DESC') }
  scope :three_most_recent, lambda { order('created_at DESC').limit(3) }
end
