class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.text :name, null: false
      t.text :director
      t.text :description
      t.integer :rank

      t.timestamps null: false
    end
  end
end
