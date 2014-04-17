# == Schema Information
#
# Table name: divisions
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  age_group    :string(255)
#  program_id   :integer
#  created_at   :datetime
#  updated_at   :datetime
#  weight_class :string(255)
#

class Division < ActiveRecord::Base
  has_many :teams
  belongs_to :program

  scope :find_teams_divisions, lambda { |div_name|
    where( name: div_name)
   }

end
