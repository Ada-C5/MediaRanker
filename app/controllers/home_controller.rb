class HomeController < ApplicationController
  def index
    @books  = Book.order(rank: :desc).limit(10) 
    @albums = Album.order(rank: :desc).limit(10) 
    @movies = Movie.order(rank: :desc).limit(10) 
  end 
end
