class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.text :title,  null: false
      t.text :artist,  null: false
      t.integer :rank,  null: false
      t.timestamps
    end
  end
end
