require_relative 'email'

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