class MoviesController < ApplicationController
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def index
  end
end
