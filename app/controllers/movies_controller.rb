class MoviesController < ApplicationController
  def new
  end

  def create
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.votes += 1
    @movie.save
    redirect_to movie_path(@movie.id)
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to all_movies_path
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def index
    @movies = Movie.all.order('votes desc')
  end

  private

  def task_create_params
    params.permit(movie: [:name, :director, :description, :votes])
  end

end
