class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @movie.destroy
    redirect_to movies_path
  end

end
