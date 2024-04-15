# frozen_string_literal: true

# Value object for name
class Name
  def initialize(name)
    @name = name
  end

  attr_reader :name
end

# Value object for password
class Password
  def initialize(password)
    @value = validate(password)
  end

  attr_reader :value

  private

  def validate(password)
    raise ArgumentError, 'Invalid password' if password.length < 8
    raise ArgumentError, 'Invalid password' if password !~ /[a-zA-Z]/ || password !~ /[0-9]/

    password
  end
end

# Value object for email
class Email
  def initialize(email)
    @value = validate(email)
  end

  attr_reader :value

  def ==(other)
    @value == other.value
  end

  private

  def validate(email)
    raise ArgumentError, 'Invalid email' unless email.match?(URI::MailTo::EMAIL_REGEXP)

    email
  end
end
