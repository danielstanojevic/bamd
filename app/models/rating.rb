class Rating < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :game



    def get_author
    author = User.find_by_id(self.author)
    if author != nil
      return author
    end
  end


end
