require_relative 'name'

RSpec.describe Name do
  it 'initialize' do
    john = Name.new('John')
    expect(john.name).to eq('John')
  end
end