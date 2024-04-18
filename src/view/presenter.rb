require_relative '../composition_root'
require_relative 'screen_view'
require 'pry'

# This class is responsible for handling the user input and output
# Where the logic is implemented, but not how is implemented, that's the (scree) view's job
# Its initalized with the view and the dependencies (CompositionRoot)
class Presenter
  def initialize(view, dependencies)
    @view = view
    @dependencies = dependencies
  end

  def run
    welcome_message

    while true
      get_all_users
      create_user
    end
  end

  private

  def welcome_message
    @view.clear_screen
    @view.welcome
  end

  def get_all_users
    all_users = @dependencies[:show_all_users].execute
    message = all_users_message(all_users)

    @view.print_all_users(message)
  end

  def create_user
    user_data = @view.ask_new_user_data

    begin
      @dependencies[:add_user].execute(**user_data)
    rescue ArgumentError => e
      @view.show_error(e.message)
    end
  end

  def all_users_message(all_users)
    if all_users.empty?
      'There are no users'
    else
      all_users.map do |user|
        "#{user.name} - #{user.email}"
      end.join(', ')
    end
  end
end
