# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

albums = [
  {name: "Kala",artist: "M.I.A", description: "The album features musical styles including dance music and makes extensive use of South Asian music such as that of the urumee, a drum used in gaana music native to Tamil Nadu, India", upvote: 100},
  {name: "Skin",artist: "Flume", description: "", upvote: 89},
  {name: "In Return",artist: "ODESZA", description: "", upvote: 55},
  {name: "Arular",artist: "M.I.A", description: "", upvote: 55},
  {name: "Channel Orange",artist: "Frank Ocean", description: "", upvote: 49},
  {name: "Nocturnal",artist: "Yuna", description: "", upvote: 23},
  {name: "25",artist: "Adele", description: "It's about making up", upvote: 15},
  {name: "Who Let the Dogs Out",artist: "Baha Men", description: "", upvote: 1},
  {name: "1989",artist: "Taylor Swift", description: "Join the squad", upvote: 0}
]

albums.each do |album|
  Album.create album
end

movies = [
  {name: "Mad Max: Fury Road",director: "George Miller", description: "A woman rebels against a tyrannical ruler", upvote: 100},
  {name: "Ex Machina",director: "Alex Garland", description: "", upvote: 89},
  {name: "Carol",director: "Todd Haynes", description: "", upvote: 55},
  {name: "The Hateful Eight",director: "Quentin Tarantino", description: "", upvote: 55},
  {name: "It Follows",director: "David Mitchell", description: "", upvote: 49},
  {name: "Gravity",director: "Alfonso Cuaron", description: "", upvote: 23},
  {name: "The Immitation Game",director: "Morten Tyldum", description: "", upvote: 15},
  {name: "Finding Dori",director: "", description: "", upvote: 1},
  {name: "World War Z",director: "Marc Forster", description: "", upvote: 0}
]

movies.each do |movie|
  Movie.create movie
end

books = [
  {name: "Practical Object-Oriented Design in Ruby",author: "Sandi Metz", description: "", upvote: 100},
  {name: "When Breath Becomes Air",author: "", description: "", upvote: 89},
  {name: "To Kill A Mockingbird",author: "", description: "", upvote: 55},
  {name: "The Great Gatsby",author: "", description: "", upvote: 55},
  {name: "Catcher In The Rye",author: "", description: "", upvote: 49},
  {name: "Lolita",author: "", description: "", upvote: 23},
  {name: "All the King's Men",author: "", description: "", upvote: 15},
  {name: "A Wrinkle in Time",author: "", description: "", upvote: 1},
  {name: "Loving",author: "", description: "", upvote: 0},
  {name: "Dog Soldiers",author: "", description: "", upvote: 0},
  {name: "Under the Net",author: "", description: "", upvote: 0},
  {name: "Catch-22",author: "", description: "", upvote: 0},
  {name: "The Assistant",author: "", description: "", upvote: 0}
]

books.each do |book|
  Book.create book
end
