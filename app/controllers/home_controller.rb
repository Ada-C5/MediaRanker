class HomeController < ApplicationController
  def index
    @top_books = Book.order('votes desc').first(10)
    @top_movies = Movie.order('votes desc').first(10)
    @top_albums = Album.order('votes desc').first(10)
  end
end
