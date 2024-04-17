require_relative 'show_all_users'
require_relative 'add_new_user'
require_relative '../entities/user'
require_relative '../../data/user_repository_in_memory'

RSpec.describe ShowAllUsers do
  it 'empty users' do
    mock_repository_in_memory = double('UserRepositoryInMemory')
    expect(mock_repository_in_memory).to receive(:show_all).and_return([])

    show_all_users = ShowAllUsers.new(mock_repository_in_memory)

    expect(show_all_users.execute).to eq([])
  end

  it 'show multiple users' do
    user1 = User.new(name: 'John Doe', email: 'john@example.com', password: 'password123')
    user2 = User.new(name: 'Juan', email: 'juan@example.com', password: 'password123')

    mock_repository_in_memory = double('UserRepositoryInMemory')
    expect(mock_repository_in_memory).to receive(:show_all).and_return([user1, user2])

    show_all_users = ShowAllUsers.new(mock_repository_in_memory)

    expect(show_all_users.execute).to eq([user1, user2])
  end

  # it 'empty users' do
  #   user_repository_in_memory = UserRepositoryInMemory.new
  #   show_all_users = ShowAllUsers.new(user_repository_in_memory)
  #   expect(show_all_users.execute).to eq([])
  # end

  # it 'show multiple users' do
  #   user1 = User.new(name: 'John Doe', email: 'john@example.com', password: 'password123')
  #   user2 = User.new(name: 'Juan', email: 'juan@example.com', password: 'password123')

  #   user_repository_in_memory = UserRepositoryInMemory.new

  #   add_new_user = AddNewUser.new(user_repository_in_memory)
  #   add_new_user.execute(user1)
  #   add_new_user.execute(user2)

  #   show_all_users = ShowAllUsers.new(user_repository_in_memory)
  #   expect(show_all_users.execute).to eq([user1, user2])
  # end
end
