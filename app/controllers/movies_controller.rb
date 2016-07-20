class MoviesController < ApplicationController

  def index
    @movies = Movie.all.order(upvotes: :desc)
    render :index
  end

  def show
    @movie = Movie.find(params[:id])
    render :show
  end

  def new
    @movie = Movie.new
    render :new
  end

  def create
    # I need to figure out a way to start out with 0 upvotes
    @movie = Movie.new(movie_access_params[:movie])
    @movie.upvotes = 0
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_access_params[:movie])
      redirect_to movie_path
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    if @movie.destroy
      redirect_to movies_path
    end
  end

  private

  def movie_access_params
    params.permit(movie: [:id, :title, :upvotes, :director, :description])
  end

end
