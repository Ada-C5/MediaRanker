class MoviesController < ApplicationController
  def index
    @movies = Movie.order(upvotes: :desc)
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
