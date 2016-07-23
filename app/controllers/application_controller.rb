class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @movies = Movie.limit(10).order('upvote desc')
    @books = Book.limit(10).order('upvote desc')
    @albums = Album.limit(10).order('upvote desc')
  end
end
