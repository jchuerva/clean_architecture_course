# Interface of the view. Where the methods that must be implemented by the presenters are defined.
module ViewInterface
  def welcome_message
    raise NotImplementedError, 'Implement this method in a subclass'
  end

  def get_all_users
    raise NotImplementedError, 'Implement this method in a subclass'
  end

  def create_user(_user)
    raise NotImplementedError, 'Implement this method in a subclass'
  end
end
