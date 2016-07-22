class AlbumsController < ApplicationController

  def index
    @albums = Album.order(rank: :desc).all
  end

  def new
    @new_album = Album.new
  end

  def create
    @new_album = Album.new
    @new_album.title = params[:album]["title"]
    @new_album.artist = params[:album]["artist"]
    @new_album.description = params[:album]["description"]
    @new_album.rank = 0
    @new_album.save
    redirect_to album_path(@new_album.id)
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
