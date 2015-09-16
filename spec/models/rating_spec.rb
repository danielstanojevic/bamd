require 'rails_helper'

describe Rating do

  describe "#get_author" do
    let(:user) { User.create!(username: "bop", password: "hahahaha") }
    let(:game) { Game.create!(name: "clap", description: "shutup") }
    let (:rating) { Rating.create!(author_id: user.id, game_id: game.id, comment: "yep", stars: 3) }

    it "returns the author of the rating" do
    expect(rating.get_author).to eq(user)
    end
  end

  describe "validations" do

    it "is NOT valid without an author id" do
      rating = Rating.new(game_id: 1, stars: 3, comment: "hi")
      rating.valid?
      expect(rating.errors[:author_id]).to_not be_empty
    end

    it "is NOT valid without a game id" do
      rating = Rating.new(author_id: 1, stars: 3, comment: "hi")
      rating.valid?
      expect(rating.errors[:game_id]).to_not be_empty
    end

    it "is NOT valid without stars" do
      rating = Rating.new(game_id: 1, author_id: 2, comment: "hi")
      rating.valid?
      expect(rating.errors[:stars]).to_not be_empty
    end

    it "is NOT valid without a comment" do
      rating = Rating.new(game_id: 1, stars: 3, author_id: 1)
      rating.valid?
      expect(rating.errors[:comment]).to_not be_empty
    end

  end

end
