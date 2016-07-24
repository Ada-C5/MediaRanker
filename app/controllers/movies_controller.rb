class MoviesController < ApplicationController

  def index
    @movies = Movie.order(votes: :desc).all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @movie.destroy
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    render :new
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_update_params[:movie])
    redirect_to movie_path
  end

  def upvote
    @movie = Movie.find(params[:id])
    current_votes = @movie.votes
    @movie.update(votes: current_votes += 1)
    redirect_to movie_path
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_create_params[:movie])
    @movie.votes = 0
    if(@movie.save)
      redirect_to movie_path(@movie.id)#redirect in case user tries to post another form - brings them to entered view
    else
      render :new
    end
  end

  private

  def movie_create_params  #tell rails which params are ok to be in the model
    params.permit(movie: [:name, :director, :description])
  end

  def movie_update_params  #tell rails which params are ok to be in the model
    params.permit(movie: [:name, :director, :description])
  end


end
