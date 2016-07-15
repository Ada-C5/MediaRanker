class MoviesController < ApplicationController

  def index

  end

  def new

  end

  def update
    @movie = Movie.find(params[:movie_id])
  end

  def show
    @movie = Movie.find(params[:movie_id])
  end

  def create

  end

  def destroy

  end

private

  def movie_params
    params.permit(movie: [:name, :director, :description, :rank])
  end
end
