class BooksController < ApplicationController

  def index
    @books = Book.order(rank: :desc).all
  end

  def new
    @new_book = Book.new
  end

  def create
    @new_book = Book.new
     @new_book.title = params[:book]["title"]
     @new_book.author = params[:book]["author"]
     @new_book.description = params[:book]["description"]
     @new_book.rank = 0
     @new_book.save
     redirect_to book_path(@new_book.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
     @book.title = params[:book]["title"]
     @book.author = params[:book]["author"]
     @book.description = params[:book]["description"]
     @book.save
     redirect_to book_path(@book.id)
  end

  def upvote
    @book = Book.find(params[:id])
    ranking = @book.rank
    @book.update(rank: ranking += 1)
    redirect_to book_path(@book.id)
   end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
end
