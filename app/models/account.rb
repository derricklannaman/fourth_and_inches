class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  has_many :players



  def make_payment
    acct = self
    bal = acct.balance / 100
    paymt = acct.transactions.first.payment
    return @current_balance = paymt / 100
  end

end
