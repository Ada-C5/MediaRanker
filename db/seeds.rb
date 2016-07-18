# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

ALBUMS = './db/albums.csv'

CSV.foreach(ALBUMS, headers: true) do |row|
  Album.create(row.to_h)
end

BOOKS = './db/books.csv'

CSV.foreach(BOOKS, headers: true) do |row|
  Book.create(row.to_h)
end

MOVIES = './db/movies.csv'

CSV.foreach(MOVIES, headers: true) do |row|
  Movie.create(row.to_h)
end