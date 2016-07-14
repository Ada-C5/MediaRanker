class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_update_params[:album])
    @album.rating = 0
		if @album.save
    	redirect_to album_path(@album.id)
  	else
  		render :new
  	end
  end

  def delete
    @album = Album.find_by(id: params[:id])
    @album.delete
    redirect_to albums_path
    #pops up confirmation to make sure you want to delete it
    #after you delete it , takes you back to album index
  end

  def edit
    @album = Album.find(params[:id])
  end

  def upvote
    @album = Album.find(params[:id])
    rating = @album.rating
    @album.update(rating: rating += 1)
    redirect_to album_path(@album.id)
  end

  def update
    @album = Album.find(params[:id])
    @album.update_attributes(album_update_params[:album])
    redirect_to album_path(@album.id)
  end

  private
  def album_update_params
		params.permit(album: [:name, :description, :artist, :rating])
	end
end
