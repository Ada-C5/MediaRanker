class BooksController < ApplicationController

  def index
    @books = Book.order(id: :asc)
    render :index
  end

  def new
    @book = Book.new
    render :create_book
  end

  def show
    @book = Book.find(params[:id])
    render :detail_view
  end

  def create
    @book = Book.create(book_create_params[:book])
    redirect_to book_path(@book.id)
  end

  def edit
    @book = Book.find(params[:id])
    render :edit
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_create_params[:book])
    redirect_to book_path(@book.id)
  end

  def vote
    @book = Book.find(params[:id])
    votes = @book.rank
    @book.update(rank: votes += 1)
    redirect_to book_path(@book.id)
  end

  def destroy
   killed_record = Book.destroy(params[:id])
   if params[:id] = true 
     redirect_to books_show_path(killed_record.vendor_id)
   end 
  end

  def book_create_params
    params.permit(book: [:name, :description, :author]) # these need to be finished with which params need to be let through
  end

end
