class BooksController < ApplicationController
  def index
    @books = Book.order(rank: :desc)
  end 

  def show
    @book = Book.find(params[:id])
  end 
end
