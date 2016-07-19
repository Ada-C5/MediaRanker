class BooksController < ApplicationController

  def index
    @books = Book.all.order('votes desc')
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @new_book = Book.new
  end

  def create
    @new_book = Book.new
    @new_book.name = params[:book]["name"]
    @new_book.author = params[:book]["author"]
    @new_book.description = params[:book]["description"]
    @new_book.votes = 0
    @new_book.save
    redirect_to book_path(@new_book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    if params.key?("upvote")
      @book = Book.find(params[:id])
      @book.votes += 1
      @book.save
      redirect_to book_path(@book.id)
    else
      @book = Book.find(params[:id])
      @book.name = params[:book]["name"]
      @book.author = params[:book]["author"]
      @book.description = params[:book]["description"]
      @book.save
      redirect_to book_path(@book.id)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

end
