class MoviesController < ApplicationController

  def index
    @movies = Movie.order(rank: :desc).all
  end

  def new
    @new_movie = Movie.new
  end

  def create
    @new_movie = Movie.new
     @new_movie.title = params[:movie]["title"]
     @new_movie.director = params[:movie]["director"]
     @new_movie.description = params[:movie]["description"]
     @new_movie.rank = 0
     @new_movie.save
     redirect_to movie_path(@new_movie.id)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
     @movie.title = params[:movie]["title"]
     @movie.director = params[:movie]["director"]
     @movie.description = params[:movie]["description"]
     @movie.save
     redirect_to movie_path(@movie.id)
  end

  def upvote
    @movie = Movie.find(params[:id])
    ranking = @movie.rank
    @movie.update(rank: ranking += 1)
    redirect_to movie_path(@movie.id)
   end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

end
