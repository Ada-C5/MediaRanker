class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def upvote
    self.upvotes += 1
    self.save
  end
end
