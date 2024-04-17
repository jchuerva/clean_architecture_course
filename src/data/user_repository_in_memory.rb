require_relative '../domain/repositories/user_repository_interface'

# data layer implementation
# In this case we are using an in-memory approach
# This class is responsible for storing and retrieving data
# It implements the methods defined in the UserRepositoryInterface
class UserRepositoryInMemory
  include UserRepositoryInterface

  def initialize
    @users = []
  end

  def show_all
    @users
  end

  def add_new_user(user)
    @users << user
    user.id
  end
end
