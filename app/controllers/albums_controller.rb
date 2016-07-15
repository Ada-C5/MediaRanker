class AlbumsController < ApplicationController

  def index
    @albums.all
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    if params[:value] == "upvote"
      @album = Album.find(params[:id])
      rank = @album[:rank] + 1
      @album.update(:rank => rank)
      render :show
    else
      @album = Album.find(params[:id])
      @album.update(album_params[:album])
      redirect_to album_path

  end

  def show
    @album = Album.find(params[:id])
  end

  def create

  end

  def destroy

  end

private

  def album_params
    params.permit(album: [:name, :artist, :description, :rank])
  end
end
