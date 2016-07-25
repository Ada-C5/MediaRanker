class BooksController < ApplicationController

  def index
    @books = Book.all.order(upvotes: :desc)
    render :index
  end

  def show
    @book = Book.find(params[:id])
    render :show
  end

  def new
    @book = Book.new
    render :new
  end

  def create
    # I need to figure out a way to start out with 0 upvotes
    @book = Book.new(book_access_params[:book])
    @book.upvotes = 0
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
    render :edit
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_access_params[:book])
      redirect_to book_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path
    end
  end

  private

  def book_access_params
    params.permit(book: [:id, :title, :upvotes, :author, :description])
  end


end
