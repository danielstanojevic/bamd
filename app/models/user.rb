class User < ActiveRecord::Base
  has_many :friendships, foreign_key: :from_id
  has_many :friendship_requesters, through: :friendships, source: :requester
  has_many :friendship_receivers, through: :friendships, source: :receiver
  has_many :purchases, foreign_key: :owner_id
  has_many :owned_games, through: :purchases, source: :game
  has_many :ratings, foreign_key: :author_id

  validates :username, presence: true, uniqueness: true

  has_secure_password

  def confirmed_friendships
    self.friendships.where(confirmed: true)#.map { |friendship| User.find(friendship.to_id) }
  end

  def friend_requests
    Friendship.where(confirmed: nil, to_id: self.id)#.map { |friendship| friendship.requester }
  end

  def pending_requests
    self.friendships.where(confirmed: nil)#.map { |friendship| friendship.receiver }
  end

  def self.search(query)
    where("username like ?", "%#{query}%")
  end

  def review(game)
    if review = game.ratings.find_by(author_id: self.id)
      review
    else
      #do something!
    end
  end
end
