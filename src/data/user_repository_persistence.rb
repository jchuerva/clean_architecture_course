require 'json'

class UserRepositoryPersistence
  include UserRepositoryInterface

  FILE_NAME = "data.json"

  def initialize
    @file_path = FILE_NAME
    load_users
  end

  def show_all
    @users
  end

  def add_new_user(user)
    @users << user
    save_users
    user.id
  end

  private

  def load_users
    @users = []
    return unless File.exist?(@file_path)

    file_data = File.read(@file_path)
    @users = JSON.parse(file_data, symbolize_names: true)
  end

  def save_users
    File.open(@file_path, 'w') do |file|
      file.write(JSON.pretty_generate(@users))
    end
  end

  def generate_id
    @users.empty? ? 1 : @users.last[:id] + 1
  end
end
