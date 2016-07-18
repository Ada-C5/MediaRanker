class Movie < ApplicationRecord
  def upvote_movie
    self.upvotes += 1
    self.save
  end
end
