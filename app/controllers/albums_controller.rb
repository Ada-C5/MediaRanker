class AlbumsController < ApplicationController

  def index
    @albums = Album.all.order(upvotes: :desc)
    render :index
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    # I need to figure out a way to start out with 0 upvotes
    @album = Album.new(album_access_params[:album])
    @album.upvotes = 0
    if @album.save
      redirect_to albums_path
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_access_params[:album])
      redirect_to album_path
    end
  end

  def destroy
    @album = Album.find(params[:id])
    if @album.destroy
      redirect_to albums_path
    end
  end

  private

  def album_access_params
    params.permit(album: [:id, :title, :upvotes, :artist, :description])
  end

end
