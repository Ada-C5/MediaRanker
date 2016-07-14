class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_update_params[:movie])
    @movie.rating = 0
    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render :new
    end
  end

  def edit
      @movie = Movie.find(params[:id])
  end

  def upvote
    @movie = Movie.find(params[:id])
    rating = @movie.rating
    @movie.update(rating: rating += 1)
    redirect_to movie_path(@movie.id)
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update_attributes(movie_update_params[:movie])
    redirect_to movie_path(@movie.id)
  end

  def delete
    @movie = Movie.find_by(id: params[:id])
    @movie.delete
    redirect_to movies_path
  end

  private

  def movie_update_params
    params.permit(movie: [:name, :director, :description, :rating])
  end

end
