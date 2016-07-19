class Article < ActiveRecord::Base
  belongs_to :category

    def get_spotify_id

      @albums = RSpotify::Album.search(title)
        @albums.each do |album|
        album.artists.each do |artist_array|
          return album.id if artist_array.name == author #=> {"label"=>"cat", "name"=>"kitty", "id"=>189955}
        end
      end
    end
end
