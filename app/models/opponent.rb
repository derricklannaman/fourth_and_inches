class Opponent < ActiveRecord::Base
  belongs_to :program
  belongs_to :team

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?


  # def full_street_address
  #   address = self.street + self.town + ', NY'
  #   binding.pry
  # end

end
