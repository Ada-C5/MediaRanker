class BooksController < ApplicationController
  def index
    @books = Book.all.order('upvote desc')
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_create_params[:book])

    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.update(params[:id], book_edit_params[:book])

    if @book.save
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.delete(params[:id]) # need a private method?

    redirect_to books_path
  end

  def upvote
    @book = Book.increment_counter(:upvote, params[:book_id])

    redirect_to book_path(params[:book_id])
  end

  private

  def book_create_params
    params.permit(book: [:name, :author,:description, :upvote])
  end

  def book_edit_params
    params.permit(book: [:name, :author,:description, :upvote, :updated_at])
  end
end
