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
    elsif params[:class] == "upvote_i"
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
    @movie = Movie.new(movie_params[:movie])
    @movie.update(:rank => 0)
     if @movie.save
       redirect_to movies_path
     else
       render "new"
     end
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to movies_path
  end

private

  def movie_params
    params.permit(movie: [:name, :director, :description, :rank])
  end
end
