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
      avg_friend_rating = sum / friend_length
     end
  end

 def is_owner?(game)
  self.owned_games.include?(game)
 end




end
