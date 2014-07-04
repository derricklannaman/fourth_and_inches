# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  balance    :decimal(, )      default(0.0)
#  user_id    :integer
#  player_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  has_many :players
end
