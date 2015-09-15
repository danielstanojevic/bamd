class Game < ActiveRecord::Base
  has_many :purchases
  has_many :owners, through: :purchases
  has_many :ratings
  has_many :game_mechanics
  has_many :mechanics, through: :game_mechanics

  # added for kaminari pagination
  paginates_per 50

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

  def get_img_file
    img_file = self.name.gsub(" ", "_")
    img_file = "/" + img_file + ".jpeg"
    img_file
  end

  def self.search(query)
    where("name like ?", "%#{query}")
  end
end
