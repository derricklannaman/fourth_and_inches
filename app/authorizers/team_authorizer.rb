class TeamAuthorizer < ApplicationAuthorizer

  def self.readable_by?(user)
    user.has_role?(:director)
  end

  def self.creatable_by?(user)
    user.has_role? :director
  end

end