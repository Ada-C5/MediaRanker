class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.string :description
      t.integer :upvotes

      t.timestamps
    end
  end
end
