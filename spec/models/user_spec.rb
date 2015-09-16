require 'rails_helper'

describe User do

  let (:user) { User.create!(username: "tester", password: "boppy") }
  let (:user2) { User.create!(username: "tester2", password: "boppy") }
  let (:user3) { User.create!(username: "tester3", password: "boppy") }
  let (:pending_friendship) { Friendship.create!(from_id: 1, to_id: 2, confirmed: nil) }
  let (:confirmed_friendship) { Friendship.create!(from_id: user.id, to_id: 3, confirmed: true) }

  describe "#confirmed_friendships" do
    it "returns confirmed friendships" do
      expect(user.confirmed_friendships).to eq([confirmed_friendship])
    end
  end

end
