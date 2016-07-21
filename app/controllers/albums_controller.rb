class AlbumsController < ApplicationController
  def index
    @albums = Album.order(rank: :desc)
  end 
end
