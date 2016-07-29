class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.text :name, null: false
      t.text :artist
      t.text :description
      t.integer :rank


      t.timestamps null: false
    end
  end
end
