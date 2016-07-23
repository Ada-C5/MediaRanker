class HomeController < ApplicationController
  def index
    @movies = Movie.order(rank: :desc).all
    @books = Book.order(rank: :desc).all
    @albums = Album.order(rank: :desc).all
  end
end
