# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Movie.destroy_all
Book.destroy_all
Album.destroy_all

movies = [
  {
    name: "Now and Then",
    director: "Someone old like me",
    description: "My favorite when young.",
    votes: 1
  },

  {
    name: "Little Champions",
    director: "Devon Sawa Admirer",
    description: "Can't remember what it was about",
    votes: 2
  },

  {
    name: "Pretty Woman",
    director: "Not Richard Gere",
    description: "Not P.C.",
    votes: 3
  }
]

movies.each do |movie|
  Movie.create(movie)
end

books = [
  {
    name: "Robinson Crusoe",
    author: "Someone smart",
    description: "My favorite book when young.",
    votes: 1
  },

  {
    name: "Little Women",
    author: "Louise May Alcott",
    description: "The Best ever.",
    votes: 2
  },

  {
    name: "Harry Potter",
    author: "J.K. Rowling",
    description: "The hubs likes it",
    votes: 3
  }
]

books.each do |book|
  Book.create(book)
end


albums = [
  {
    name: "All My Ada Ladies",
    artist: "Beeyonce",
    description: "Awesome.",
    votes: 1
  },

  {
    name: "Gatos en el Balcon",
    artist: "Fey",
    description: "Very 90's",
    votes: 2
  },

  {
    name: "Pies Descalzos",
    artist: "Shakira",
    description: "Antes de ser famosa",
    votes: 3
  }
]

albums.each do |album|
  Album.create(album)
end
