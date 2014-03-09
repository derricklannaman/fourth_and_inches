# == Schema Information
#
# Table name: dashboards
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Dashboard < ActiveRecord::Base

  belongs_to :user
end
