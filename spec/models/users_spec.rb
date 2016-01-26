require 'rails_helper'

describe User do
  let(:john) { User.create(id: 10, firstname: "John", lastname: "Doe", email: "me@email.com",
                        password_digest: "password", admin: true) }
  let(:jay) { User.create(id: 11, firstname: "Jay", lastname: "Dean", email: "jay@email.com",
                        password_digest: "password", admin: false) }
  let(:sally) { User.create(admin: nil) }

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

    it "returns true for admin users" do
      expect(john.admin).to be(true)
    end

    it "does not return true for non-admin users" do
      expect(sally.admin).to_not be(true)
    end
  end

  describe "#is_admin?" do
    it "returns true for admin users" do
      expect(john.is_admin?).to be(true)
    end

    it "doesn't return true for non-admin users" do
      expect(sally.is_admin?).to_not be(true)
    end
  end

  describe "#friends" do
    it "returns an array" do
      expect(john.friends).to be_an(Array)
    end

    context "when a friend request has status true" do
      let (:new_req) { FriendRequest.new(sender_id: 10, recipient_id: 11, status: true) }

      it "adds a friend when friend request is true" do
        jay
        new_req.save
        # expect{new_req.save}.to change{john.friends.count}.by(1)
        expect(john.friends.count).to be(1)
      end
    end
  end

end
