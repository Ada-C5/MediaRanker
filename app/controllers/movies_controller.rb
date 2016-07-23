class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order('upvote desc')
  end

  def upvote
    @movie = Movie.increment_counter(:upvote, params[:movie_id])

    redirect_to movies_path
  end

  private

  def movie_params
    params.permit(movie: [:name, :director,:description, :upvote])
  end
end
