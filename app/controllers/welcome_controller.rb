class WelcomeController < ApplicationController
  def index
    @movies = Movie.limit(10).order(upvotes: :desc)
    @books = Book.limit(10).order(upvotes: :desc)
    @albums = Album.limit(10).order(upvotes: :desc)
  end
end
