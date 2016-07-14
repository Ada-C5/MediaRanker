class MoviesController < ApplicationController
  def index
    @movies = Movie.order(upvotes: :desc)
  end
end
