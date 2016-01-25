require 'rails_helper'

describe User do
  let(:user) { User.new }
    # (firstname: "John", lastname: "Doe", email: "me@email.com", password_digest: "password") }

  describe "#create" do
    it "has a firstname, lastname, and email" do
      p :user
      expect(:user.firstname).to_not be_empty
    end
  end


end
