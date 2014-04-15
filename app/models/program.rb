class Program < ActiveRecord::Base
  has_many :users
  has_many :teams
  has_many :divisions
end
