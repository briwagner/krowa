require 'rails_helper'

describe User do
  let(:john) { User.new(firstname: "John", lastname: "Doe", email: "me@email.com", password_digest: "password") }

  describe "#create" do
    it "has a firstname" do
      expect(john.firstname).to_not be_empty
    end

    it "has a lastname" do
      expect(john.lastname).to_not be_empty
    end

    it "has an email" do
      expect(john.email).to_not be_empty
    end

    it "has a password" do
      expect(john.password_digest).to_not be_empty
    end

  end


end
