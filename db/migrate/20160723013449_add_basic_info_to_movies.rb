class AddBasicInfoToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :name, :string, null: false
    add_column :movies, :director, :string
    add_column :movies, :description, :string
    add_column :movies, :vote, :integer, default: 0
  end
end
