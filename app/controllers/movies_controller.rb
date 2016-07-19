class MoviesController < ApplicationController

  def index
    @movies = Movie.all.order('votes desc')
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @new_movie = Movie.new
  end

  def create
    @new_movie = Movie.new
    @new_movie.name = params[:movie]["name"]
    @new_movie.director = params[:movie]["director"]
    @new_movie.description = params[:movie]["description"]
    @new_movie.votes = 0
    @new_movie.save
    redirect_to movie_path(@new_movie.id)
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    if params.key?("upvote")
      @movie = Movie.find(params[:id])
      @movie.votes += 1
      @movie.save
      redirect_to movie_path(@movie.id)
    else
      @movie = Movie.find(params[:id])
      @movie.name = params[:movie]["name"]
      @movie.director = params[:movie]["director"]
      @movie.description = params[:movie]["description"]
      @movie.save
      redirect_to movie_path(@movie.id)
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

end
