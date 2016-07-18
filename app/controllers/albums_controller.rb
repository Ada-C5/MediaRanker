class AlbumsController < ApplicationController
  def index
    @albums = Album.order(upvotes: :desc)
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(albums_params[:album])
    @album.upvotes = 0
    @album.save
    redirect_to albums_path
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    Album.update(params[:id], albums_params[:album])
    redirect_to albums_path
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  def upvote
    @album = Album.find(params[:id])
    @album.upvote
    redirect_to albums_path
  end

  private

  def albums_params
    params.permit(album: [:title, :artist, :description])
  end
end
