class BooksController < ApplicationController

  def create
    @new_book = Book.new
    @new_book.title = params[:book]["title"]
    @new_book.author = params[:book]["author"]
    @new_book.description = params[:book]["description"]
    @new_book.rank = 0
    @new_book.save
    redirect_to book_path(@new_book.id)
  end
end
