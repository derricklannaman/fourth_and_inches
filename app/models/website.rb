# == Schema Information
#
# Table name: websites
#
#  id          :integer          not null, primary key
#  program_url :string(255)
#  program_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#  town        :string(255)
#  team        :string(255)
#  slug        :string(255)
#

class Website < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      [:town, :team]
    ]
  end

  belongs_to :program
end
