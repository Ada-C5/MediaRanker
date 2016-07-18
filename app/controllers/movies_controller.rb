class MoviesController < ApplicationController
  def index
    @movies = Movie.order(upvotes: :desc)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movies_params[:movie])
    if @movie.save
      flash[:success] = "You successfully added a movie."
      redirect_to movies_path
    else
      flash.now[:error] = 'Movie must have a title.'
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    Movie.update(params[:id], movies_params[:movie])
    redirect_to movies_path
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.upvote
    redirect_to movies_path
  end

  private

  def movies_params
    params.permit(movie: [:title, :director, :description])
  end
end