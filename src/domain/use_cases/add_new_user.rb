
class AddNewUser
  def initialize(user_repository)
    @user_repository = user_repository
  end

  def execute(user)
    if user.email.nil? && @user_repository.show_all.any? { |u| u.email == user.email }
      raise ArgumentError, 'Email already exists'
    end

    user = User.new(user)
    @user_repository.add_new_user(user)
  end
end