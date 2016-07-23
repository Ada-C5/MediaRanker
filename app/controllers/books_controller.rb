class BooksController < ApplicationController
  def index
    @books = Book.all.order('upvote desc')
  end

  def upvote
    @book = Book.increment_counter(:upvote, params[:book_id])

    redirect_to books_path
  end

  private

  def book_create_params
    params.permit(book: [:name, :author,:description, :upvote])
  end

  def book_edit_params
    params.permit(book: [:name, :author,:description, :upvote, :updated_at])
  end
end
