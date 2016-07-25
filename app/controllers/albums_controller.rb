class AlbumsController < ApplicationController
  def index
    @albums = Album.all.order('upvote desc')
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_create_params[:album])

    if @album.save
      redirect_to album_path(@album.id)
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.update(params[:id], album_edit_params[:album])

    if @album.save
      redirect_to album_path(@album.id)
    else
      render :edit
    end
  end

  def destroy
    @album = Album.delete(params[:id]) # need a private method?

    redirect_to albums_path
  end

  def upvote
    @album = Album.increment_counter(:upvote, params[:album_id])

    redirect_to album_path(params[:album_id])
  end

  private

  def album_create_params
    params.permit(album: [:name, :artist,:description, :upvote])
  end

  def album_edit_params
    params.permit(album: [:name, :artist,:description, :upvote, :updated_at])
  end
end
