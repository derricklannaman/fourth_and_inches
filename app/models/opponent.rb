class Opponent < ActiveRecord::Base
  belongs_to :program
  belongs_to :team
end
