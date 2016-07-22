class AlbumsController < ApplicationController

  def index
    @albums = Album.order(rank: :desc).all
  end

  def new
    @new_album = Album.new
  end

  def create
    @album = Album.create(album_params[:album])
    redirect_to albums_path
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    #not sure what this is going to look like yet
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destory
    redirect_to albums_path
  end
end
