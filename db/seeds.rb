# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
movie_seed = [
  {name: "Star Wars", director: "George Lucas", description: "unparalleled epic space tale", rank: 89},
  {name: "Splendor in the Grass", director: "Elia Kazan", description: "A fragile Kansas girl's love for a handsome young man from the town's most powerful family drives her to heartbreak and madness.", rank: 62},
  {name: "Singing in the Rain", director: "Stanley Donen", description: "Please don't take us seriously, we like to sing and dance", rank: 55}
]

movie_seed.each do |movie|
  Movie.create(movie)
end

book_seed = [
  {name: "War and Peace",author: "Leo Tolstoy", description: " regarded as one of the central works of world literature", rank: 89},
  {name: "The Harbinger", author: "Elia Kazan", description: "not sure just number one on NYT list", rank: 62},
  {name: "The Dark Tower", author: "Steven King", description: "Super scary Steven King stuff - do not read at night", rank: 55}
]

book_seed.each do |book|
  Book.create(book)
end

album_seed = [
  {name: "Paul's Boutique",artist: "Beastie Boys", description: "classic must have", rank: 89},
  {name: "Three is the Magic Number", artist: "De La Sol", description: "De La Soul", rank: 62},
  {name: "The Black Keys", artist: "The Black Keys", description: "because you have a soul", rank: 55}
]

album_seed.each do |album|
  Album.create(album)
end
