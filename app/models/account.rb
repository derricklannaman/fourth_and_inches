class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  has_many :players



  def make_payment
    acct = self
    bal = acct.balance / 100
    paymt = acct.transactions.first.payment
    acct.balance = paymt / 100
    acct.save
  end

end
