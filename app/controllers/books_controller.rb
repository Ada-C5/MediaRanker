class BooksController < ApplicationController
  def index
    @books = Book.all.order('upvote desc')
  end

  def upvote
    @book = Book.increment_counter(:upvote, params[:book_id])

    redirect_to books_path
  end

  private

  def book_params
    params.permit(book: [:name, :author,:description, :upvote])
  end
end
