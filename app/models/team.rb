# == Schema Information
#
# Table name: teams
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  age_group      :string(255)
#  num_of_players :integer          default(11)
#

class Team < ActiveRecord::Base

  belongs_to :user
  has_many :players


  scope :active, lambda { where(active: true)[0] }
  scope :most_recent_first, lambda { order('created_at DESC') }
  scope :three_most_recent, lambda { order('created_at DESC').limit(3) }

  def self.show_active_team
    if active == false
      return
    else
      @active_team = active
    end
  end



end
