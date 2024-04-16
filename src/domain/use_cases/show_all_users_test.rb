
require_relative 'show_all_users'
require_relative '../entities/user'

RSpec.describe ShowAllUsers do
  it 'empty users' do
    user_repository = double(:user_repository)
    expect(user_repository).to receive(:show_all).and_return([])
    show_all_users = ShowAllUsers.new(user_repository)
    expect(show_all_users.execute).to eq([])
  end
  
  it 'multiple users' do
    user1 = User.new('John Doe', 'john@example.com', 'password123')
    user2 = User.new('Juan', 'juan@example.com', 'password123')
    user_repository = double(:user_repository)
    expect(user_repository).to receive(:show_all).and_return([user1, user2])
    show_all_users = ShowAllUsers.new(user_repository)
    expect(show_all_users.execute).to eq([user1, user2])
  end
end


