class BooksController < ApplicationController
    def index
    @books = Book.order(upvotes: :desc)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(books_params[:book])
    if @book.save
      flash[:success] = "You successfully added a book."
      redirect_to books_path
    else
      flash.now[:error] = 'Book must have a title.'
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    Book.update(params[:id], books_params[:book])
    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def upvote
    @book = Book.find(params[:id])
    @book.upvote
    redirect_to books_path
  end

  private

  def books_params
    params.permit(book: [:title, :author, :description])
  end
end
