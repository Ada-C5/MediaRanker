class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_update_params[:book])
    @book.rating = 0
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def delete
    @book = Book.find_by(id: params[:id])
    @book.delete
    redirect_to books_path
  end

  def upvote
    @book = Book.find(params[:id])
    rating = @book.rating
    @book.update(rating: rating += 1)
    redirect_to book_path(@book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update_attributes(book_update_params[:book])
    redirect_to book_path(@book.id)
  end

  private


  def book_update_params
    params.permit(book: [:name, :description, :author, :rating])
  end

end
