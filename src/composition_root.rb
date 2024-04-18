require_relative 'domain/use_cases/show_all_users'
require_relative 'domain/use_cases/add_new_user'
require_relative 'data/user_repository_in_memory'
require_relative 'data/user_repository_persistence'

# The composition root is responsible for creating the dependencies of the application
# It's used by the Presenter to get the dependencies
module CompositionRoot
  def self.configure_dependencies(repository_type)

    user_repository = if repository_type == 'in_memory'
                        UserRepositoryInMemory.new
                      else
                        UserRepositoryPersistence.new
                      end
    {
      show_all_users: ShowAllUsers.new(user_repository),
      add_user: AddNewUser.new(user_repository)
    }
  end
end
