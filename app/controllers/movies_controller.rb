class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
      @movie = Movie.find(params[:id])
  end

  def edit
      @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    rating = @movie.rating
    @movie.update(rating: rating += 1)
    redirect_to movie_path(@movie.id)
  end

  def delete
    @movie = Movie.find(params[:id])
  end

end
