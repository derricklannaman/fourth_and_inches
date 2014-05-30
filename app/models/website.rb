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
