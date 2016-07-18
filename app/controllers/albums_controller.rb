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
    if @album.save
      flash[:success] = "You successfully added an album."
      redirect_to albums_path
    else
      flash.now[:error] = 'Album must have a title.'
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.update(params[:id], albums_params[:album])
    if @album.save
      flash[:success] = "You successfully edited an album."
      redirect_to books_path
    else
      flash.now[:error] = 'Album must have a title.'
      render :new
    end
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
