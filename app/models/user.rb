class User < ActiveRecord::Base
  has_many :friendships, foreign_key: :from_id
  has_many :requested_friends, through: :friendships, source: :requester
  has_many :friend_requests, through: :friendships, source: :receiver
  has_many :purchases, foreign_key: :owner_id
  has_many :owned_games, through: :purchases, source: :game
  has_many :ratings, foreign_key: :author_id
end
