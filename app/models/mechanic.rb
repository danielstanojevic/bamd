class Mechanic < ActiveRecord::Base
  has_many :game_mechanics
  has_many :games, through: :game_mechanics

  def self.search(query)
    where("description like ?", "%#{query}")
  end
end
