class MoviesController < ApplicationController
  def index
    @movies = Movie.order(rank: :desc)
  end 
end
