class HomeController < ApplicationController

  def index
    @movies = Movie.all.order(upvotes: :desc).limit(10)
    @books = Book.all.order(upvotes: :desc).limit(10)
    @albums = Album.all.order(upvotes: :desc).limit(10)
    render :index
  end

end
