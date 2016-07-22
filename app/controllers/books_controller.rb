class BooksController < ApplicationController

  def create
    @book = Book.create(book_params[:book])
    redirect_to books_path
  end
end
