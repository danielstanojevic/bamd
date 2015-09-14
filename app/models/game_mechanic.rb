class GameMechanic < ActiveRecord::Base
  belongs_to :mechanic
  belongs_to :game
end
