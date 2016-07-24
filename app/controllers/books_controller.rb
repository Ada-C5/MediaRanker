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
    @book = Book.new(book_params[:book])
    @book.update(:rank => 0)
     if @book.save
       redirect_to books_path
     else
       render "new"
     end
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to books_path
  end

private

  def book_params
    params.permit(book: [:name, :author, :description, :rank])
  end
end
