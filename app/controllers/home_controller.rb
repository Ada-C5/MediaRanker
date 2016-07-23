class HomeController < ApplicationController

  def index
    @movies = Movie.limit(10).order('upvote desc')
    @books = Book.limit(10).order('upvote desc')
    @albums = Album.limit(10).order('upvote desc')
  end
end
