require 'rails_helper'

describe User do
    before(:each) do
       @user = User.create!(username: "tester", password: "boppy")
       @user2 = User.create!(username: "tester2", password: "boppy")
       @user3 = User.create!(username: "tester3", password: "boppy")
       @pending_friendship =  Friendship.create!(from_id: @user.id, to_id: @user3.id, confirmed: nil)
       @confirmed_friendship =  Friendship.create!(from_id: @user.id, to_id: @user3.id, confirmed: true)
       @receiving = Friendship.create!(from_id: @user3.id, to_id: @user2.id, confirmed: nil)
       @game = Game.create!(name: "Boppy", description: "Win Win")
       @game.ratings << @rating = Rating.create!(stars: 4, comment: "bop", author_id: @user.id, game_id: @game.id)
       @user3.owned_games << @game
    end
    after(:each) do
      User.all.destroy_all
      Friendship.all.destroy_all
    end
  describe "#confirmed_friendships" do
    it "returns confirmed friendships" do
      expect(@user.confirmed_friendships).to eq([@confirmed_friendship])
    end
  end

  describe "#friends" do
    it "returns an array of the users friends" do
      expect(@user.friends).to eq([@user3])
    end
  end

  describe "#friend_owners" do
    it "returns an array of friends who own a game" do
      expect(@user.friend_owners(@game)).to eq([@user3])
    end
  end

  describe "#friend_requests" do
    it "returns all friendships that are pending" do
      expect(@user2.friend_requests).to eq([@receiving])
    end
  end

  describe "#pending_requests" do
    it "returns all friendships that are pending" do
      expect(@user.pending_requests).to eq([@pending_friendship])
    end
  end

  describe "#search" do
    it "returns users that have a matching username" do
      expect(User.search("tester")).to include(@user)
    end
  end

  describe "#review" do
    it "returns a review the user has given for a particular game" do
      expect(@user.review(@game)).to eq(@rating)
    end
  end


  describe "#is_owner?" do
    it "returns true if the user owns the game" do
      expect(@user3.is_owner?(@game)).to eq(true)
    end

    it "returns false if the user does not own the game" do
      expect(@user.is_owner?(@game)).to eq(false)
    end
  end

  describe "validations" do
    it "is NOT valid without a username" do
      valid_user = User.new(password: "boppy")
      expect(valid_user.valid?).to eq(false)
    end

    it "is NOT valid without a password" do
      valid_user = User.new(username: "bop")
      expect(valid_user.valid?).to eq(false)
    end

    it "is NOT valid if the username is not unique" do
      valid_user = User.new(username: "tester", password: "boppy")
      expect(valid_user.valid?).to eq(false)
    end

    it "is valid if the username is unique and there is a password" do
      valid_user = User.new(username: "misterman", password: "boppy")
      expect(valid_user.valid?).to eq(true)

    end

  end

end
