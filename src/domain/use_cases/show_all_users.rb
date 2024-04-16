
class ShowAllUsers
  def initialize(user_repository)
    @user_repository = user_repository
  end

  def execute
    @user_repository.show_all
  end
end
