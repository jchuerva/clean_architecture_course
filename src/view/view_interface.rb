# Interface of the view. Where the methods that must be implemented by the presenters are defined.
module ViewInterface
  def clear_screen
    raise NotImplementedError, 'Implement this method in a subclass'
  end

  def welcome
    raise NotImplementedError, 'Implement this method in a subclass'
  end

  def print_all_users(_message)
    raise NotImplementedError, 'Implement this method in a subclass'
  end
  
  def show_error(_error)
    raise NotImplementedError, 'Implement this method in a subclass'
  end

  def ask_new_user_data
    raise NotImplementedError, 'Implement this method in a subclass'
  end
end
