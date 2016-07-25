class AddBasicInfoToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :name, :string, null: false
    add_column :albums, :artist, :string
    add_column :albums, :description, :string
    add_column :albums, :upvote, :integer, default: 0
  end
end
