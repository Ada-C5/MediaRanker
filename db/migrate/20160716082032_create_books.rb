class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text :name, null: false
      t.text :author
      t.text :description
      t.integer :rank

      t.timestamps null: false
    end
  end
end
