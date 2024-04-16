class AddNewUser
  def initialize(user_repository)
    @user_repository = user_repository
  end

  def execute(user)
    if @user_repository.show_all.any? { |u| u.email.value == user.email.value }
      raise ArgumentError, 'Email already exists'
    end

    @user_repository.add_new_user(user)
  end
end
