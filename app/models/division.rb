class Division < ActiveRecord::Base
  has_many :teams
  belongs_to :program
end
