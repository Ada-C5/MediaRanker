class Vote < ApplicationRecord
  belongs_to :album
  belongs_to :book
  belongs_to :movie
end
