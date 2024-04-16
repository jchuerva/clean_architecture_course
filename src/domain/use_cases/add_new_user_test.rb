require_relative 'add_new_user'
require_relative '../entities/user'
require_relative '../../data/user_repository_in_memory'

RSpec.describe AddNewUser do
  it 'add user' do
    user1 = User.new('John Doe', 'john@example.com', 'password123')
    add_new_user = AddNewUser.new(UserRepositoryInMemory)
    add_new_user.execute(user1)
    show_all_users = ShowAllUsers.new(UserRepositoryInMemory)
    expect(show_all_users.execute).to eq([user1])
  end
  
  # it 'multiple users' do
  #   user1 = User.new('John Doe', 'john@example.com', 'password123')
  #   user2 = User.new('Juan', 'juan@example.com', 'password123')
  #   user_repository = double(:user_repository)
  #   expect(user_repository).to receive(:show_all).and_return([user1, user2])
  #   show_all_users = ShowAllUsers.new(user_repository)
  #   expect(show_all_users.execute).to eq([user1, user2])
  # end
end