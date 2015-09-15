class User < ActiveRecord::Base
  has_many :friendships, foreign_key: :from_id
  has_many :friendship_requesters, through: :friendships, source: :requester
  has_many :friendship_receivers, through: :friendships, source: :receiver
  has_many :purchases, foreign_key: :owner_id
  has_many :owned_games, through: :purchases, source: :game
  has_many :ratings, foreign_key: :author_id

  validates :username, presence: true, uniqueness: true

  has_secure_password

  def confirmed_friends
    self.friendships.where(confirmed: true).map { |friendship| User.find(friendship.to_id) }
  end

  def friend_requests
    self.friendship_requesters.where(confirmed: !true)
  end

  def pending_requests
    self.friendship_receivers.where(confirmed: !true)
  end

  def self.search(query)
    where("username like ?", "%#{query}%")
  end
end
