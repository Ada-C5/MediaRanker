class Book < ApplicationRecord
  validates :title, presence: true
  validates :upvotes, presence: true, numericality: { only_integer: true }
end
