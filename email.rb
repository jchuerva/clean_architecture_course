require 'uri'

class Email
  attr_reader :value

  def initialize(value)
    @value = validate(value)
  end


  def ==(other)
    @value == other.value
  end

  private

  def validate(value)
    raise ArgumentError, 'Invalid email' unless value.match?(URI::MailTo::EMAIL_REGEXP)

    value
  end
end