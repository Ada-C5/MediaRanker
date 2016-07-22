class MoviesController < ApplicationController
  def create
    @new_movie = Movie.new
    @new_movie.title = params[:movie]["title"]
    @new_movie.director = params[:movie]["director"]
    @new_movie.description = params[:movie]["description"]
    @new_movie.rank = 0
    @new_movie.save
    redirect_to movie_path(@new_movie.id)
  end
end
