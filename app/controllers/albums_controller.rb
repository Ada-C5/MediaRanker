class AlbumsController < ApplicationController

  def index
    @albums = Album.order(votes: :desc).all
  end

  def show
    @album = Album.find(params[:id])
  end

  def destroy
    @album = Album.find(params[:album_id])
    @album.destroy
    redirect_to albums_path
  end

  def edit
    @album = Album.find(params[:album_id])
    render :new
  end

  def update
    @album = Album.find(params[:id])
    @album.update(album_update_params[:album])
    redirect_to album_path
  end

  def upvote
    @album = Album.find(params[:id])
    current_votes = @album.votes
    @album.update(votes: current_votes += 1)
    redirect_to album_path
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_create_params[:album])
    @album.votes = 0
    if(@album.save)
      redirect_to album_path(@album.id)#redirect in case user tries to post another form - brings them to entered view
    else
      render :new
    end
  end

  private

  def album_create_params  #tell rails which params are ok to be in the model
    params.permit(album: [:name, :artist, :description])
  end

  def album_update_params  #tell rails which params are ok to be in the model
    params.permit(album: [:name, :artist, :description])
  end


end
