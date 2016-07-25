var massive = require('massive')
var connectionString = "postgres://localhost/media_development"
var connectionString_test = "postgres://localhost/media_test"

var db = massive.connectSync({connectionString : connectionString})
var db_test = massive.connectSync({connectionString : connectionString_test})

var movies_data = require("../db/seeds/movies")
var books_data = require("../db/seeds/books")
var albums_data = require("../db/seeds/albums")

var moviesCount = 0
var booksCount = 0
var albumsCount = 0

function seed() {
  // saveSync is not asynchronous, it's blocking, ok for stuff like this that is run every once in a while
  for (var movie of movies_data) {
    db.movies.save(movie, function (err,res) {
      if (err) {
        throw new Error(err.message)
      }
    })

    db_test.movies.save(movie, function (err,res) {
      if (err) {
        throw new Error(err.message)
      }
      moviesCount++
      checkFinish()
    })
  }

  for (var book of books_data) {
    db.books.save(book, function (err,res) {
      if (err) {
        throw new Error(err.message)
      }
    })

    db_test.books.save(book, function (err,res) {
      if (err) {
        throw new Error(err.message)
      }
      booksCount++
      checkFinish()
    })
  }

  for (var album of albums_data) {
    db.albums.save(album, function (err,res) {
      if (err) {
        throw new Error(err.message)
      }
    })

    db_test.albums.save(album, function (err,res) {
      if (err) {
        throw new Error(err.message)
      }
      albumsCount++
      checkFinish()
    })
  }
}

function checkFinish() {
  var totalCount = moviesCount + booksCount + albumsCount
  var totalLength = movies_data.length + books_data.length + albums_data.length

  if (totalCount >= totalLength) { process.exit() }
}

seed()
