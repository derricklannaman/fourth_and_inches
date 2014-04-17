class Division < ActiveRecord::Base
  has_many :teams
  belongs_to :program


  scope :find_teams_divisions, lambda { |div_name|
    where( name: div_name)
   }

end
