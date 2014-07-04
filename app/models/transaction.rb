# == Schema Information
#
# Table name: transactions
#
#  id             :integer          not null, primary key
#  payment        :decimal(30, 2)   default(0.0)
#  account_credit :decimal(30, 2)   default(0.0)
#  user_id        :integer
#  account_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :account
end
