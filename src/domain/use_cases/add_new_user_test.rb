require_relative 'add_new_user'
require_relative 'show_all_users'
require_relative '../entities/user'
require_relative '../../data/user_repository_in_memory'

RSpec.describe AddNewUser do
  it 'add user' do
    user1 = User.new(name: 'John Doe', email: 'john@example.com', password: 'password123')
    user_repository_in_memory = UserRepositoryInMemory.new

    add_new_user = AddNewUser.new(user_repository_in_memory)
    add_new_user.execute(user1)

    show_all_users = ShowAllUsers.new(user_repository_in_memory)
    expect(show_all_users.execute).to eq([user1])
  end

  it 'add user with existing email' do
    user1 = User.new(name: 'John Doe', email: 'john@example.com', password: 'password123')
    user_repository_in_memory = UserRepositoryInMemory.new

    add_new_user = AddNewUser.new(user_repository_in_memory)
    add_new_user.execute(user1)

    user2 = User.new(name: 'John Papa', email: 'john@example.com', password: 'password123')
    expect { add_new_user.execute(user2) }.to raise_error(ArgumentError, 'Email already exists')
  end
end
