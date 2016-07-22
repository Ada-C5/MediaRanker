class AddBookIdAndAlbumsIdToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :book_id, :integer
    add_column :votes, :album_id, :integer
  end
end
