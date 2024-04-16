require_relative 'password'

RSpec.describe Password do
  it 'invalid lenght' do
    expect { Password.new('1234') }.to raise_error('Invalid password: too short')
  end

  it 'does not contains a letter' do
    expect { Password.new('12345678') }.to raise_error('Invalid password: must contain at least one letter and one digit')
  end

  it 'does not contains a number' do
    expect { Password.new('qwertyui') }.to raise_error('Invalid password: must contain at least one letter and one digit')
  end

  it 'valid password' do
    password = Password.new('1234567a')
    expect(password.value).to eq('1234567a')
  end
end