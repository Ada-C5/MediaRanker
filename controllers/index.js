var Album = require("../models/album")
var Book = require("../models/book")
var Movie = require("../models/movie")

var IndexController = {

  index: function (req, res, next) {
    locals = {}

    Movie.all(function(error, movies) {
      if(error) {
        var err = new Error("Error retrieving movie list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        locals.movies = movies
      }
    })

    Book.all(function(error, books) {
      if(error) {
        var err = new Error("Error retrieving book list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        locals.books = books
      }
    })

    Album.all(function(error, albums) {
      if(error) {
        var err = new Error("Error retrieving album list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        locals.albums = albums
      }
    })

    console.log(locals)

    res.render ('home', { locals: locals })

  }

}

module.exports = IndexController
