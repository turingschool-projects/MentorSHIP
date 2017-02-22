class UserFactory
  def initialize(authenticator)
    @authenticator = authenticator
  end

  def find_or_create_user
    User.find_or_create_by(name: authenticator.name)
  end

  private

  attr_reader :authenticator
end
