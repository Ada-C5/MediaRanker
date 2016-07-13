class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
  end

  def delete
    album = Album.find_by(id: params[:album_id])
    album.delete
    #pops up confirmation to make sure you want to delete it
    #after you delete it , takes you back to album index
  end

  def edit
  end

  def update
  end
end


# get     'albums'            => 'albums#index'
# get     'albums/:id'        => 'albums#show',    as: :album
# delete  'albums/:id'        => 'albums#delete'
# get     'albums/:id/edit'   => 'albums#edit',   as: :edit_album
# patch   'albums/:id/update' => 'albums#update', as: :update_album
