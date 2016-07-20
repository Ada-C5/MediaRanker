class MoviesController < ApplicationController

  def index
    @movies = Movie.order(id: :asc)
    render :index
  end

  def new
    @movie = Movie.new
    render :create_movie
  end

  def show
    @movie = Movie.find(params[:id])
    render :detail_view
  end

  def create
    @movie = Movie.create(movie_create_params[:movie])
    redirect_to movie_path(@movie.id)
  end

  def edit
    @movie = Movie.find(params[:id])
    render :edit
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_create_params[:movie])
    redirect_to movies_path
  end

  def destroy
   killed_record = Movie.destroy(params[:id])
   if params[:id] = true 
     redirect_to movies_show_path(killed_record.vendor_id)
   end 
  end

  def movie_create_params
    params.permit(movie: [:name, :description, :director]) # these need to be finished with which params need to be let through
  end

end
