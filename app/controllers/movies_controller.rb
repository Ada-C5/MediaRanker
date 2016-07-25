class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order('upvote desc')
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_create_params[:movie])

    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.update(params[:id], movie_edit_params[:movie])

    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.delete(params[:id]) # need a private method?

    redirect_to movies_path
  end

  def upvote
    @movie = Movie.increment_counter(:upvote, params[:movie_id])

    redirect_to movie_path(params[:movie_id])
  end

  private

  def movie_create_params
    params.permit(movie: [:name, :director,:description, :upvote])
  end

  def movie_edit_params
    params.permit(movie: [:name, :director,:description, :upvote, :updated_at])
  end
end
