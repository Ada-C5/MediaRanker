class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    change_table :books do |t|
      t.text :title,  null: false
      t.text :author,  null: false
      t.integer :rank,  null: false
      t.timestamps
    end
  end
end
