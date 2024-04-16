require_relative '../value_objects/email'
require_relative '../value_objects/password'
require 'securerandom'

class User
  attr_reader :id, :name, :email, :password

  def initialize(id: SecureRandom.uuid, name: nil, email: nil, password: nil)
    validate_presence(name, email, password)
    @id = id
    @name = name
    @email = Email.new(email).value
    @password = Password.new(password).value
  end

  def ==(other)
    @id == other.id
  end

  private

  def validate_presence(name, email, password)
    raise ArgumentError, 'Name is required' if name.nil? || name.empty?
    raise ArgumentError, 'Email is required' if email.nil? || email.empty?
    raise ArgumentError, 'Password is required' if password.nil? || password.empty?
  end
end
