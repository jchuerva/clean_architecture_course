# This module is used to define the methods that every data layer should implement.
# Raising an error if a data layer does not implement these methods.
# It's a way to create an interfaz in Ruby.
module UserRepositoryInterface
  def show_all
    raise NotImplementedError, 'Implement this method in a subclass'
  end

  def add_new_user(_user)
    raise NotImplementedError, 'Implement this method in a subclass'
  end
end
