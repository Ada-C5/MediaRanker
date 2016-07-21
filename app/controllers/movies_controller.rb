class MoviesController < ApplicationController
  def index
    @movies = Movie.order(rank: :desc)
  end 

  def show
    @movie = Movie.find(params[:id])
  end 

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params[:movie])
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.update(params[:id], movie_params[:movie])
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  def rank
    @movie = Movie.find(params[:id])
    rank = @movie.rank += 1 
    @movie.update(rank: rank)
    redirect_to movies_path
  end

  private

  def movie_params
    params.permit(movie: [:title, :director, :description])
  end
end
