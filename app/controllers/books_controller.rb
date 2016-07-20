class BooksController < ApplicationController

  def index
    @books = Book.order(rank: :desc).all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id]) 
  end

  def update
    @book = Book.find(params[:id])
    @book.update_attributes(book_update_params[:book])
    redirect_to book_path(@book.id)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params[:book])
    redirect_to books_path
  end

  def upvote
    @book = Book.find(params[:id])
    ranking = @book.rank
    @book.update(rank: ranking += 1)
    redirect_to book_path(@book.id) 
  end

  def destroy
    @book = Book.find(params[:id]).delete
    redirect_to books_path
  end

  private

  def book_params
    params.permit(book: [:title, :directed_by, :description])
  end
  
end
