class MoviesController < ApplicationController

  def index

  end

  def new

  end

  def update

  end

  def show

  end

  def create

  end

  def destroy

  end

private

  def movie_params
    params.permit(:movie[:name, :director, :description])
  end
end
