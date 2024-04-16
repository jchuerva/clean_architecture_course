class Password
  attr_reader :value

  def initialize(value)
    @value = validate(value)
  end

  private

  def validate(value)
    validate_length(value)
    validate_complexity(value)
    value
  end

  def validate_length(value)
    raise ArgumentError, 'Invalid password: too short' if value.length < 8
  end

  def validate_complexity(value)
    raise ArgumentError, 'Invalid password: must contain at least one letter and one digit' unless value =~ /[a-zA-Z]/ && value =~ /[0-9]/
  end
end