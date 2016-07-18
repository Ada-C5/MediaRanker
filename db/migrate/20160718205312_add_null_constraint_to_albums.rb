class AddNullConstraintToAlbums < ActiveRecord::Migration[5.0]
  def change
    change_column :albums, :title, :string, :null => false
    change_column :albums, :upvotes, :integer, :default => 0
  end
end
