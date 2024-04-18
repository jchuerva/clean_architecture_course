require_relative '../domain/repositories/user_repository_interface'
require 'pry'

# data layer implementation
# In this case we are using an in-memory approach
# This class is responsible for storing and retrieving data
# It implements the methods defined in the UserRepositoryInterface

# Tiene q adaptar los datos al dominio.
# Si conoce las entidades del dominio (e.g: User)
class UserRepositoryPersistence
  include UserRepositoryInterface

  FILE_NAME = 'users'.freeze

  def initialize
    create_file
  end

  def show_all
    users = get_files_lines
    users.map do |user|
      user_data = user.split(',')

      User.new(
        id: user_data[0],
        name: user_data[1],
        email: user_data[2],
        password: user_data[3].chomp
      )
    end
  end

  def add_new_user(user)
    file = File.open(FILE_NAME, 'a')
    file.puts(format_user(user))
    file.close
  end

  private

  def create_file
    return if File.exist?(FILE_NAME)

    file = File.open(FILE_NAME, 'w')
    file.close
  end

  def get_files_lines
    file = File.open(FILE_NAME, 'r')

    users = []
    # Iterate over each line in the file
    file.each_line do |line|
      users << line
    end
    file.close

    users
  end

  def format_user(user)
    "#{user.id},#{user.name},#{user.email},#{user.password}"
  end
end
