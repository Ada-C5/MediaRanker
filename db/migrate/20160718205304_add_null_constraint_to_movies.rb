class AddNullConstraintToMovies < ActiveRecord::Migration[5.0]
  def change
    change_column :movies, :title, :string, :null => false
    change_column :movies, :upvotes, :integer, :default => 0
  end
end
