class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :description
      t.string :photo
      t.integer :category_id
      t.integer :ranking

      t.timestamps null: false
    end
  end
end
