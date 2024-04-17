# Uses cases are the business logic of the application.
# They are the intermediary between the data layer and the presentation layer.
# But they are not aware of the data layer implementation.
# Validations are done at this level to decouple them from the data layer.
class AddNewUser
  def initialize(user_repository)
    @user_repository = user_repository
  end

  def execute(user)
    # validations are done at this level to decouple them from the data layer
    # If they were done in the data layer, every data layer implementation would have to implement them. DRY principle.
    raise ArgumentError, 'Email already exists' if @user_repository.show_all.any? { |u| u.email == user.email }

    @user_repository.add_new_user(user)
  end
end
