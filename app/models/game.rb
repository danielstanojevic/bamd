class Game < ActiveRecord::Base
  has_many :purchases
  has_many :owners, through: :purchases
  has_many :ratings
  has_many :game_mechanics
  has_many :mechanics, through: :game_mechanics
end
