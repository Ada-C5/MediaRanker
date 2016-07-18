class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    change_table :movies do |t|
      t.text :title,  null: false
      t.text :director,  null: false
      t.integer :rank,  null: false
      t.timestamps
    end
  end
end
