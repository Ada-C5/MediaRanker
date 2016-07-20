class MoviesController < ApplicationController

  def index
    @movies = Movie.order(rank: :desc).all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def upvote
    @movie = Movie.find(params[:id])
    ranking = @movie.rank
    @movie.update(rank: ranking += 1)
    redirect_to movie_path(@movie.id) 
  end
end
