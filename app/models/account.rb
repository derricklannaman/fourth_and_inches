class Account < ActiveRecord::Base
  has_many :transactions
  belongs_to :user
  belongs_to :player
end
