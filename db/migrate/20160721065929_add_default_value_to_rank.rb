class AddDefaultValueToRank < ActiveRecord::Migration[5.0]
  def change
  change_column :albums, :rank, :integer, :default => 0
  change_column :books, :rank, :integer, :default => 0
  change_column :movies, :rank, :integer, :default => 0
  end
end