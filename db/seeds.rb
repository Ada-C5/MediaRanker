# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

movies = [
  {
    title: "Sharknado",
    director: "Kevin Reynolds",
    description: "The setting of the film is in the distant future. Although no exact date was given in the film itself, it has been suggested that it takes place in 2500.[4] The polar ice caps have completely melted, and the sea level has risen over 7,600 m (25,000 feet), covering nearly all the land. The film illustrates this with an unusual variation on the Universal logo, which begins with the usual image of Earth, but shows the planet's water levels gradually rising and the polar ice caps melting until nearly all the land is submerged. The plot of the film centers on an otherwise nameless antihero, 'The Mariner', a drifter who sails the Earth in his trimaran.",
    upvotes: 5
  },
  {
    title: "The Blues Brothers",
    director: "John Landis",
    description: "They're on a mission from God.",
    upvotes: 3
  },
  {
    title: "Eternal Sunshine",
    director: "A Dude",
    description: "Great movie.",
    upvotes: 3
  }
]

Movie.create(movies)

books = [
  {
    title: "The Name of the Wind",
    author: "Patrick Rothfuss",
    description: "name of the wind description!!!",
    upvotes: 12
  },
  {
    title: "The Martian",
    author: "Andy Weir",
    description: "Astronaut gets stranded on Mars, must survive until NASA (a) realizes he's not dead and (b) sends a rescue mission. Swearing! Explosions! Technical blunders!",
    upvotes: 8
  },
  {
    title: "Bossy Pants",
    author: "Tina Fey",
    description: "Her pants are so bossy.",
    upvotes: 1
  }
]

Book.create(books)

albums = [
  {
    title: "The White Album",
    artist: "Beatles",
    description: "wow An excellent album, please give me lots of votes!",
    upvotes: 2
  },
  {
    title: "Thriller",
    artist: "Michael Jackson",
    description: "what even needs to be said",
    upvotes: 4
  },
  {
    title: "Purple Rain",
    artist: "Prince",
    description: "purple rain!!",
    upvotes: 4
  }
]

Album.create(albums)
