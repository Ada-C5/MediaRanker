class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def delete
  end

  def edit
  end

  def update
    @book = Book.find(params[:id])
    rating = @book.rating
    @book.update(rating: rating += 1)
    redirect_to book_path(@book.id)
  end
end
