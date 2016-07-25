class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.string :artist
      t.integer :upvotes, null: false
      t.text :description
      t.timestamps null: false
    end
  end
end
