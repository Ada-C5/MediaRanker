# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Album.create(name: "Moondance", artist: "Van Morrison", description: "So good", rating: 10)
Album.create(name: "Cone of Silence", artist: "Sheep Sized Dinosaurs", description: "OTP", rating: 2)

Movie.create(name: "Jurassic Park", director: "Don't remember", description: "Chaos", rating: 5)
Movie.create(name: "Goonies", director: "Spielberg? Maybe?", description: "Goonies never say die.", rating: 12)

Book.create(name: "Alive", author: "Piers Paul Read", description: "Nice book about a walk through the mountains.", rating: 100)
Book.create(name: "The Alienist", author: "Caleb Carr", description: "Serial Killers", rating: 50)
