require_relative 'user'

RSpec.describe User do
  describe "#initialize" do
    context "with valid name, email, and password" do
      it "creates a user object" do
        user = User.new("John Doe", "john@example.com", "password123")

        expect(user.id).to_not be_nil
        expect(user.name.value).to eq("John Doe")
        expect(user.email.value).to eq("john@example.com")
        expect(user.password.value).to eq("password123")
      end
    end

    it "raises ArgumentError with missing name" do
      expect { User.new(nil, "john@example.com", "password123") }.to raise_error(ArgumentError, 'Name is required')
    end

    it "raises ArgumentError with missing email" do
      expect { User.new("John Doe", nil, "password123") }.to raise_error(ArgumentError, 'Email is required')
    end

    it "raises ArgumentError with missing password" do
      expect { User.new("John Doe", "john@example.com", nil) }.to raise_error(ArgumentError, 'Password is required')
    end
  end
end
