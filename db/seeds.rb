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
    description: "My favorite when young."
  },

  {
    name: "Little Champions",
    director: "Devon Sawa Admirer",
    description: "Can't remember what it was about"
  },

  {
    name: "Pretty Woman",
    director: "Not Richard Gere",
    description: "Not P.C."
  }
]

movies.each do |movie|
  Movie.create(movie)
end
