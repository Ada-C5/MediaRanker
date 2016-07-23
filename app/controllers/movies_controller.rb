class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order('upvote desc')
  end
end
