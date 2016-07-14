# rake db:seed

album_list = [
  { name: "Crazy In Love", artist: "Beyonce", description: "She's really in love.", votes: 10 },
  { name: "Purple Rain", artist: "Prince", description: "80s power ballads.", votes: 1 },
  { name: "Thriller", artist: "Michael Jackson", description: "", votes: 3 },
  { name: "Channel Orange", artist: "Frank Ocean", description: "lovesit.", votes: 0 },
  { name: "Whatever", artist: "Beyonce", description: "She's really in love.", votes: 10 },
  { name: "OK", artist: "Prince", description: "80s power ballads.", votes: 1 },
  { name: "Hi There", artist: "Michael Jackson", description: "", votes: 3 },
  { name: "Music is Neat", artist: "Frank Ocean", description: "lovesit.", votes: 0 },
  { name: "It's fine", artist: "Beyonce", description: "She's really in love.", votes: 10 },
  { name: "Sample Album", artist: "Prince", description: "80s power ballads.", votes: 1 },
  { name: "Runnings out of ideas", artist: "Michael Jackson", description: "", votes: 3 },
  { name: "Seedz", artist: "Frank Ocean", description: "lovesit.", votes: 0 }
]

album_list.each do |album|
  Album.create(album)
end

puts "#{Album.count} albums added."

book_list = [
  { name: "Harry Potter", author: "J.K. Rowling", description: "obvi", votes: 10},
  { name: "Digital Fortress", author: "Dan Brown", description: "my husband likes this book", votes: 0},
  { name: "Another Book", author: "Idont Readenough", description: "", votes: 2}
]

book_list.each do |book|
  Book.create(book)
end

puts "#{Book.count} books added."

movie_list = [
  {name: "Titanic", director: "Some Guy", description: "Super sad tho", votes: 3},
  {name: "You've Got Mail", director: "Dunno", description: "This is from the 90s I hear", votes: 0}
]

movie_list.each do |movie|
  Movie.create(movie)
end

puts "#{Movie.count} movies added."
