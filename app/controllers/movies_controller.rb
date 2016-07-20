class MoviesController < ApplicationController

  def index
    @movies = Movie.order(rank: :desc).all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id]) 
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update_attributes(movie_update_params[:movie])
    redirect_to movie_path(@movie.id)
  end

  def upvote
    @movie = Movie.find(params[:id])
    ranking = @movie.rank
    @movie.update(rank: ranking += 1)
    redirect_to movie_path(@movie.id) 
  end

  def destroy
    @movie = Movie.find(params[:id]).delete
    redirect_to movies_path
  end

  private

  def movie_update_params
    params.permit(movie: [:title, :directed_by, :description])
  end
  
end
