require_relative '../domain/repositories/user_repository_interface'

class UserRepositoryInMemory 
  include UserRepositoryInterface

  @users = []

  def show_all
    @users
  end

  def add_new_user(user)  
    @users << user
  end
end
