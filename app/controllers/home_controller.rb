class HomeController < ApplicationController
  def index
    @albums = Album.order(votes: :desc).all
    @books = Book.order(votes: :desc).all
    @movies = Movie.order(votes: :desc).all
  end
end
