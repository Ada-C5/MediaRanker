class TopicsController < ApplicationController

  def index
     @movies = Movie.all
     @movies[0].votes
    # @books = Book.all
    # @albums = Album.all
    binding.pry

  end




  def top_books
  end

  def top_albums
  end

  def top_movies

  end


end
