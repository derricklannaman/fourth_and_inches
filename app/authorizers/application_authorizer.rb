# Other authorizers should subclass this one
class ApplicationAuthorizer < Authority::Authorizer

  # Any class method from Authority::Authorizer that isn't overridden
  # will call its authorizer's default method.
  #
  # @param [Symbol] adjective; example: `:creatable`
  # @param [Object] current_user - whatever represents the current user in your app
  # @return [Boolean]
  def self.default(adjective, user)
    user.has_role? :director
  end

  def updatable_by?(user)
    user.has_role?(:director)
  end

  def updatable_by?(user)
    user.has_role?(:director)
  end

  def updatable_by?(user)
    user.has_role?(:director)
  end

  def updatable_by?(user)
    user.has_role?(:director)
  end






end
