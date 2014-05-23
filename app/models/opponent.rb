class Opponent < ActiveRecord::Base
  belongs_to :program
  belongs_to :team


  geocoded_by :address #unless self.count < 1
  after_validation :geocode, :if => :address_changed?
end
