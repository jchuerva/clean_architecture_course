

class UserRepository

  @users = []

  def self.show_all
    @users
  end

  def self.add_new_user(user)
    if user.email.nil? && @users.any? { |u| u.email == user.email }
      raise ArgumentError, 'Email already exists'
    end

    @users << user
  end
end