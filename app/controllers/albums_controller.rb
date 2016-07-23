class AlbumsController < ApplicationController
  def index
    @albums = Album.all.order('upvote desc')
  end

  def upvote
    @album = Album.increment_counter(:upvote, params[:album_id])

    redirect_to albums_path
  end

  private

  def album_create_params
    params.permit(album: [:name, :artist,:description, :upvote])
  end

  def album_edit_params
    params.permit(album: [:name, :artist,:description, :upvote, :updated_at])
  end
end
