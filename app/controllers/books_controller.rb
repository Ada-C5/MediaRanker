class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def update
    if params[:class] == "upvote"
      @book = Book.find(params[:id])
      rank = @book[:rank] + 1
      @book.update(:rank => rank)
      render "show"
    else
      @book = Book.find(params[:id])
      @book.update(book_params[:book])
      redirect_to book_path
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    Book.create(book_params[:book])
  end

  def destroy

  end

private

  def book_params
    params.permit(book: [:name, :author, :description, :rank])
  end
end
