class BooksController < ApplicationController
  def index
    @books = Book.all.order('upvote desc')
  end
end
