class AlbumsController < ApplicationController

  def index
    @albums = Album.order(id: :asc)
    render :index
  end

  def new
    @album = Album.new
    render :create_album
  end

  def show
    @album = Album.find(params[:id])
    render :detail_view
  end

  def create
    @album = Album.create(album_create_params[:album])
    redirect_to album_path(@album.id)
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    @album.update(album_create_params[:album])
    redirect_to albums_path
  end

  def destroy
   killed_record = Album.destroy(params[:id])
   if params[:id] = true 
     redirect_to albums_show_path(killed_record.vendor_id)
   end 
  end

  def album_create_params
    params.permit(album: [:name, :description, :artist]) # these need to be finished with which params need to be let through
  end

end
