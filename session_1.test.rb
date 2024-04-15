# frozen_string_literal: true

require './session_1'

RSpec.describe Name do
  it 'initialize' do
    john = Name.new('John')

    expect(john.name).to eq('John')
  end
end

RSpec.describe Password do
  it 'invalid lenght' do
    expect { Password.new('1234') }.to raise_error('Invalid password')
  end
  it 'does not contains a letter' do
    expect { Password.new('12345678') }.to raise_error('Invalid password')
  end
  it 'does not contains a number' do
    expect { Password.new('qwertyui') }.to raise_error('Invalid password')
  end
  it 'valid password' do
    password = Password.new('1234567a')

    expect(password.value).to eq('1234567a')
  end
end

RSpec.describe Email do
  it 'invalid format' do
    expect { Email.new('email') }.to raise_error('Invalid email')
    expect { Email.new('1234') }.to raise_error('Invalid email')
  end

  it 'valid format' do
    email = Email.new('email@email.com')
    expect(email.value).to eq('email@email.com')
  end

  it 'equality' do
    email = Email.new('email@email.com')
    email2 = Email.new('email@email.com')

    expect(email == email2).to be(true)
  end
end
