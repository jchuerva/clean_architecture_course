# This module is used to define the methods that every data layer should implement.
# Raising an error if a data layer does not implement these methods.
module UserRepositoryInterface
  def show_all
    raise NotImplementedError, 'Implement this method in a subclass'
  end

  def add(_user)
    raise NotImplementedError, 'Implement this method in a subclass'
  end
end
