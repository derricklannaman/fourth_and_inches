# == Schema Information
#
# Table name: programs
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  league_name :string(255)
#  town_name   :string(255)
#  team_name   :string(255)
#

class Program < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :access_codes, dependent: :destroy
  has_many :teams, dependent: :destroy
  has_many :divisions, dependent: :destroy
  has_many :opponents, dependent: :destroy
end
