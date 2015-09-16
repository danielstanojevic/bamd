require 'rails_helper'

describe Game do
  let(:game) { Game.create!(name: "Bop", description: "Wee") }
  let (:game2) { Game.create!(name: "hehe", description: "dee") }
  let (:game3) { Game.create!(name: "Boo", description: "bee") }

  describe "#avg_user_rating" do
    it 'returns an average user rating' do
      game.ratings << (Rating.new(stars: 5, comment: "WEE"))
      expect(game.avg_user_rating).to eq(5)
    end
  end

  describe "#get_img_file" do
    it "returns a properly formated name for an image" do
      game.name = "The Alex Guy"
      expect(game.get_img_file).to eq("/The_Alex_Guy.jpeg")
    end
  end

  describe "#order_by_user_friend_rating" do
    it "returns an array of games sorted by rating" do
      game2.ratings << (Rating.new(stars: 5, comment: "WEE"))
      game.ratings << (Rating.new(stars: 4, comment: "WEE"))
      game3.ratings << (Rating.new(stars: 3, comment: "WEE"))
      sorted = Game.order_by_user_friend_rating
      expect(sorted[0]).to eq(game2)
      expect(sorted[1]).to eq(game)
      expect(sorted[2]).to eq(game3)
    end
  end

  describe "#search" do
    it "returns a match if there is one in the database" do
      expect(Game.search("Boo")).to eq([game3])
    end

    it "doesn't find a match if there isn't one" do
      expect(Game.search("BANG")).to eq([])
    end
  end

  describe "validations" do
    let (:valid_game) { Game.new }
    it "is NOT valid without a name" do
      valid_game.description = "Bop"
      expect(valid_game.valid?).to eq(false)
    end

    it "is NOT valid without a description" do
      valid_game.name = "Pie"
      expect(valid_game.valid?).to eq(false)
    end

    it "IS valid with a name and description" do
      valid_game.name = "Pie"
      valid_game.description = "Yummy"
      expect(valid_game.valid?).to eq(true)

    end
  end

end
