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

  def edit
    @movie = Movie.find(params[:movie_id])
    render :new
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_update_params[:movie])
    redirect_to movie_path
  end

  private

  def movie_create_params  #tell rails which params are ok to be in the model
    params.permit(movie: [:name, :director, :description])
  end

  def movie_update_params  #tell rails which params are ok to be in the model
    params.permit(movie: [:name, :director, :description])
  end


end
