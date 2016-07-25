class InitialModels < ActiveRecord::Migration[5.0]
  def change
    change_table :albums do |t|
      t.text :title
      t.text :artist
      t.integer :rank
    end 

    change_table :books do |t|
      t.text :title
      t.text :author
      t.integer :rank
    end 

    change_table :movies do |t|
      t.text :title
      t.text :director
      t.integer :rank
    end 
  end
end
