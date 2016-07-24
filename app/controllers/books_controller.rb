class BooksController < ApplicationController

  def index
    @books = Book.order(votes: :desc).all
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:book_id])
    render :new
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_update_params[:book])
    redirect_to book_path
  end

  def upvote
    @book = Book.find(params[:id])
    current_votes = @book.votes
    @book.update(votes: current_votes += 1)
    redirect_to book_path
  end

  private

  def book_create_params  #tell rails which params are ok to be in the model
    params.permit(book: [:name, :author, :description])
  end

  def book_update_params  #tell rails which params are ok to be in the model
    params.permit(book: [:name, :author, :description])
  end



end
