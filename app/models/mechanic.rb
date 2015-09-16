class Mechanic < ActiveRecord::Base
  has_many :game_mechanics
  has_many :games, through: :game_mechanics

  validates :description, presence: true

  # added for kaminari pagination
  paginates_per 50

  def self.search(query)
    where("description like ?", "%#{query}")
  end
end
