class MoviesController < ApplicationController
  def index
    @movies = Movie.order(upvotes: :desc)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.upvote_movie
    redirect_to movie_path(params[:id])
  end
end
