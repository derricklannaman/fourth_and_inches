class Player < ActiveRecord::Base

  has_many :users, :through => :teams
  has_and_belongs_to_many :teams
end
