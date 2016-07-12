class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :artist
      t.string :description
      t.integer :rating

      t.timestamps
    end
  end
end
