# == Schema Information
#
# Table name: opponents
#
#  id         :integer          not null, primary key
#  program_id :integer
#  team_id    :integer
#  name       :string(255)
#  notes      :text
#  division   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  street     :string(255)
#  town       :string(255)
#  zip        :string(255)
#  address    :string(255)
#  latitude   :float
#  longitude  :float
#  state      :string(255)
#

class Opponent < ActiveRecord::Base
  belongs_to :program
  belongs_to :team


  geocoded_by :address #unless self.count < 1
  after_validation :geocode, :if => :address_changed?
end
