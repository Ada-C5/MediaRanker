class AddNullConstraintToBooks < ActiveRecord::Migration[5.0]
  def change
    change_column :books, :title, :string, :null => false
    change_column :books, :upvotes, :integer, :default => 0
  end
end
