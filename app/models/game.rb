class Game < ActiveRecord::Base
  has_many :purchases
  has_many :owners, through: :purchases
  has_many :ratings
  has_many :game_mechanics
  has_many :mechanics, through: :game_mechanics

  def avg_user_rating
    rating_sum = 0
    if self.ratings.empty?
      return "no ratings"
    else
      self.ratings.each do |rating|
        rating_sum += rating.stars
      end
      return average_rating = rating_sum/self.ratings.length
    end
  end
end
