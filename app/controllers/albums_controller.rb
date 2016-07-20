class AlbumsController < ApplicationController

   def index
    @albums = Album.order(rank: :desc).all
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id]) 
  end

  def update
    @album = Album.find(params[:id])
    @album.update_attributes(album_params[:album])
    redirect_to album_path(@album.id)
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(album_params[:album])
    redirect_to albums_path
  end

  def upvote
    @album = Album.find(params[:id])
    ranking = @album.rank
    @album.update(rank: ranking += 1)
    redirect_to album_path(@album.id) 
  end

  def destroy
    @album = Album.find(params[:id]).delete
    redirect_to albums_path
  end

  private

  def album_params
    params.permit(album: [:title, :directed_by, :description])
  end
end
