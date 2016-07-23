class HomeController < ApplicationController

  def index
    @top = 10
    @movies = Movie.limit(@top).order('upvote desc')
    @books = Book.limit(@top).order('upvote desc')
    @albums = Album.limit(@top).order('upvote desc')
  end
end
