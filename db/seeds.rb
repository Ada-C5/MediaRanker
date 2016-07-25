# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

albums = [
  { title: "The King of Limbs", artist: "Radiohead", description: "Amazing, 2011", rank: 11 },
  { title: "The Bends", artist: "Radiohead", description: "Fantastic, 1995", rank: 9 },
  { title: "In Rainbows", artist: "Radiohead", description: "Breath-taking, 2007", rank: 10 },
  { title: "Hail to the Thief", artist: "Radiohead", description: "Wow, 2003", rank: 8 },
  { title: "OK Computer", artist: "Radiohead", description: "Phenomenal, 1997", rank: 11 },
  { title: "Kid A", artist: "Radiohead", description: "Life-changing, 2000", rank: 10 },
  { title: "Amnesiac", artist: "Radiohead", description: "Ground-breaking, 2001", rank: 9 },
  { title: "Pablo Honey", artist: "Radiohead", description: "Eye-opening, 1993", rank: 8 },
  { title: "A Moon Shaped Pool", artist: "Radiohead", description: "New and incredible, 2016", rank: 12 }
]

albums.each do |album|
  Album.create(album)
end


books = [
  { title: "Harry Potter and the Sorcerer's Stone", author: "J.K. Rowling", description: "First book", rank: 10 },
  { title: "Harry Potter and the Chamber of Secrets", author: "J.K. Rowling", description: "Second book", rank: 9},
  { title: "Harry Potter and the Prosoner of Azkaban", author: "J.K. Rowling", description: "Third book", rank: 11 },
  { title: "Harry Potter and the Goblet of Fire", author: "J.K. Rowling", description: "Forth book", rank: 12},
  { title: "Harry Potter and the Order of the Phoenix", author: "J.K. Rowling", description: "Fifth book", rank: 9},
  { title: "Harry Potter and the Half-Blood Prince", author: "J.K. Rowling", description: "Sixth book", rank: 10},
  { title: "Harry Potter and the Deathly Hallows", author: "J.K. Rowling", description: "Seventh book", rank: 11}
]

books.each do |book|
  Book.create(book)
end



movies = [
  { title: "The Lord of the Rings: The Fellowship of the Ring", director: "Peter Jackson", description: "First movie", rank: 10 },
  { title: "The Lord of the Rings: The Two Towers", director: "Peter Jackson", description: "Second movie", rank: 9},
  { title: "The Lord of the Rings: The Return of the King", director: "Peter Jackson", description: "Third movie", rank: 9}
]

movies.each do |movie|
  Movie.create(movie)
end
