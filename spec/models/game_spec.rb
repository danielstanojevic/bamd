require 'rails_helper'

describe Game do
  let(:game) { Game.new }

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


end
