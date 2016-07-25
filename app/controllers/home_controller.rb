class HomeController < ApplicationController

  def index
    @top = 10
    @movies = Movie.limit(@top+1).order('upvote desc')
    @books = Book.limit(@top+1).order('upvote desc')
    @albums = Album.limit(@top+1).order('upvote desc')
    @categories = [@movies, @books, @albums]
  end
end
