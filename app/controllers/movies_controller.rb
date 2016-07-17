class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def update
    if params[:class] == "upvote"
      @movie = Movie.find(params[:id])
      rank = @movie[:rank] + 1
      @movie.update(:rank => rank)
      render "show"
    else
      @movie = Movie.find(params[:id])
      @movie.update(movie_params[:movie])
      redirect_to movie_path
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    Movie.create(movie_params[:movie])
  end

  def destroy

  end

private

  def movie_params
    params.permit(movie: [:name, :director, :description, :rank])
  end
end
