require_relative 'domain/use_cases/show_all_users'
require_relative 'domain/use_cases/add_new_user'
require_relative 'data/user_repository_in_memory'

# The composition root is responsible for creating the dependencies of the application
# It's used by the Presenter to get the dependencies
module CompositionRoot
  def self.configure_dependencies
    user_repository = UserRepositoryInMemory.new
    {
      show_all_users: ShowAllUsers.new(user_repository),
      add_user: AddNewUser.new(user_repository)
    }
  end
end
