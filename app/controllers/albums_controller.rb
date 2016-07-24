class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    if params[:class] == "upvote"
      @album = Album.find(params[:id])
      rank = @album[:rank] + 1
      @album.update(:rank => rank)
      render :show
    else
      @album = Album.find(params[:id])
      @album.update(album_params[:album])
      redirect_to album_path
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(album_params[:album])
    @album.update(:rank => 0)
     if @album.save
       redirect_to albums_path
     else
       render "new"
     end
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to albums_path
  end

private

  def album_params
    params.permit(album: [:name, :artist, :description, :rank])
  end
end
