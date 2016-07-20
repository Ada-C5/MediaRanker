class AlbumsController < ApplicationController

    def index
      @albums = Album.all.order('votes desc')
    end

    def show
      @album = Album.find(params[:id])
    end

    def new
      @new_album = Album.new
    end

    def create
      @new_album = Album.new
      @new_album.name = params[:album]["name"]
      @new_album.artist = params[:album]["artist"]
      @new_album.description = params[:album]["description"]
      @new_album.votes = 0
      @new_album.save
      redirect_to album_path(@new_album.id)
    end

    def edit
      @album = Album.find(params[:id])
    end

    def update
      if params.key?("upvote")
        @album = Album.find(params[:id])
        @album.votes += 1
        @album.save
        redirect_to album_path(@album.id)
      else
        @album = Album.find(params[:id])
        @album.name = params[:album]["name"]
        @album.artist = params[:album]["artist"]
        @album.description = params[:album]["description"]
        @album.save
        redirect_to album_path(@album.id)
      end
    end

    def destroy
      @album = Album.find(params[:id])
      @album.destroy
      redirect_to albums_path
    end

end
