class AddBasicInfoToBooks < ActiveRecord::Migration
  def change
    add_column :books, :name, :string, null: false
    add_column :books, :author, :string
    add_column :books, :description, :string
    add_column :books, :vote, :integer, default: 0
  end
end
