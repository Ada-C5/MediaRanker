class AlbumsController < ApplicationController
  def index
    @albums = Album.all.order('upvote desc')
  end
end
