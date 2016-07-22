class MoviesController < ApplicationController
  def create
    @movie = Movie.create(movie_params[:movie])
    redirect_to movies_path
  end
end
