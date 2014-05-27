# == Schema Information
#
# Table name: schedules
#
#  id          :integer          not null, primary key
#  date        :date
#  time        :time
#  entry_type  :string(255)
#  team_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  opponent_id :integer
#

class Schedule < ActiveRecord::Base
  belongs_to :team
end
