class BooksController < ApplicationController
  def index

  end

  def new

  end

  def update

  end

  def show
    @book = Book.find(params[:book_id])
  end

  def create

  end

  def destroy

  end

private

  def book_params
    params.permit(book: [:name, :author, :description, :rank])
  end
end
