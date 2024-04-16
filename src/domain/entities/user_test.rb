require_relative 'user'

RSpec.describe User do
  describe '#initialize' do
    context 'with valid name, email, and password' do
      it 'creates a user object' do
        user = User.new(id: 1, name: 'John Doe', email: 'john@example.com', password: 'password123')

        expect(user.id).to be(1)
        expect(user.name).to eq('John Doe')
        expect(user.email).to eq('john@example.com')
        expect(user.password).to eq('password123')
      end
    end

    it 'raises ArgumentError with missing name' do
      expect do
        User.new(id: 1, email: 'john@example.com', password: 'password123')
      end.to raise_error(ArgumentError, 'Name is required')
    end

    it 'raises ArgumentError with missing email' do
      expect do
        User.new(id: 1, name: 'John Doe', password: 'password123')
      end.to raise_error(ArgumentError, 'Email is required')
    end

    it 'raises ArgumentError with missing password' do
      expect do
        User.new(id: 1, name: 'John Doe', email: 'john@example.com')
      end.to raise_error(ArgumentError, 'Password is required')
    end
  end
end
