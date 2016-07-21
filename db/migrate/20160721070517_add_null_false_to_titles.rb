class AddNullFalseToTitles < ActiveRecord::Migration[5.0]
  def change
    change_column_null :albums, :title, false
    change_column_null :books, :title, false
    change_column_null :movies, :title, false
  end
end
