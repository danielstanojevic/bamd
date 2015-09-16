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
    self.friendships.where(confirmed: true)
  end

  def friends
    friends = []
    self.confirmed_friendships.each do |friendship|
      friends << User.find(friendship.receiver.id)
    end
    friends
  end

  def friend_owners(game)
    friend_owners = []
    self.friends.each do |friend|
      if friend.owned_games.include?(game)
        friend_owners << friend
        end
      end
    friend_owners
  end

  def friend_requests
    Friendship.where(confirmed: nil, to_id: self.id)
  end

  def pending_requests
    self.friendships.where(confirmed: nil)
  end

  def self.search(query)
    where("username like ?", "%#{query}%")
  end

  def review(game)
    if review = game.ratings.find_by(author_id: self.id)
      review
    end
  end

  def get_friend_avg(game)
    sum = 0
    friend_length = 0
    self.confirmed_friendships.each do |friendship|
      friendship.receiver.ratings.each do |rating|
        if rating.game_id == game.id
          sum += rating.stars
          friend_length += 1
        end
      end
    end
    if friend_length == 0
      return "No friends have rated this game"
    else
      return avg_friend_rating = sum / friend_length
    end
  end

  def is_owner?(game)
    self.owned_games.include?(game)
  end
end
