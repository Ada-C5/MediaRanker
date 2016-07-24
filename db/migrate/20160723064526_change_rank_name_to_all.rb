class ChangeRankNameToAll < ActiveRecord::Migration
  def change
    rename_column :movies, :rank, :votes
    rename_column :books, :rank, :votes
    rename_column :albums, :rank, :votes
  end
end
