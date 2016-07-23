class AddRankToAll < ActiveRecord::Migration
  def change
    add_column :movies, :rank, :integer
    add_column :books, :rank, :integer
    add_column :albums, :rank, :integer
  end
end
