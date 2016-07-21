class BooksController < ApplicationController
  def index
    @books = Book.order(rank: :desc)
  end 
end
