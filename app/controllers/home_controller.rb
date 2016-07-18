class HomeController < ApplicationController
  def index
    @books = Book.all 
    @albums = Album.all
    @movies = Movie.all 
  end 
end
