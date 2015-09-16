class Rating < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :game

  validates :author_id, :game_id, :stars, :comment, presence: true

  # added for kaminari pagination
  paginates_per 50

  def get_author
    author = User.find_by_id(self.author)
    if author != nil
      return author
    end
  end
end
