module UserRepositoryInterface
  def show_all
    raise NotImplementedError, 'Implement this method in a subclass'
  end

  def add(_user)
    raise NotImplementedError, 'Implement this method in a subclass'
  end
end
