class AlbumsController < ApplicationController

  def index

  end

  def new

  end

  def update

  end

  def show

  end

  def create

  end

  def destroy

  end

private

  def album_params
    params.permit(:album[:name, :artist, :description])
  end
end
