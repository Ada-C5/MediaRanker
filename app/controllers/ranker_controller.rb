class RankerController < ApplicationController

  def index
    @albums = Album.all.order(:rating).reverse
    @movies = Movie.all.order(:rating).reverse
    @books  = Book.all.order(:rating).reverse
  end


end
