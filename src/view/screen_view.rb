# Used by the Presenter and interprestate the actions of it.
# It's responsible for implement the logic of the actions.
# We could have multiple ScreenViews, one for each type of interface (CLI, Web, etc)
class ScreenView
  def clear_screen
    puts "\e[H\e[2J"
  end

  def welcome
    puts 'Welcome to the app!'
  end

  def print_all_users(message)
    puts "All users: #{message}"
  end

  def show_error(error)
    puts "Error: #{error}"
  end

  def ask_new_user_data
    puts 'Create a new user'
    puts 'Enter name:'
    name = gets.chomp

    puts 'Enter email:'
    email = gets.chomp

    puts 'Enter password:'
    password = gets.chomp

    { name: name, email: email, password: password }
  end
end
