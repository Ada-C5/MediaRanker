class AlbumsController < ApplicationController
  def index
    @albums = Album.order(rank: :desc)
  end 

  def show
    @album = Album.find(params[:id])
  end 

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params[:album])
    if @album.save
      redirect_to albums_path
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.update(params[:id], album_params[:album])
    if @album.save
      redirect_to albums_path
    else
      render :new
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  def rank
    @album = Album.find(params[:id])
    rank = @album.rank += 1 
    @album.update(rank: rank)
    redirect_to albums_path
  end

  private

  def album_params
    params.permit(album: [:title, :artist, :description])
  end
end
