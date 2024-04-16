require_relative 'name'
require_relative 'email'
require_relative 'password'
require 'securerandom'

class User
  attr_reader :id, :name, :email, :password

  def initialize(name, email, password)
    validate_presence(name, email, password)
    @id = SecureRandom.uuid 
    @name = Name.new(name)
    @email = Email.new(email)
    @password = Password.new(password)
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
