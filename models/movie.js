var app = require("../app");
var db = app.get("db");

// Constructor function
var Movie = function(movie) {
  this.id = movie.id
  this.name = movie.name
  this.description = movie.description
  this.by = movie.director
  this.votes = movie.votes
}

Movie.all = function(callback) {
  db.run("SELECT * FROM movies ORDER BY votes;", function(error, movies) {
    if(error || !movies) {
      callback(error || new Error("Could not retrieve movies"), undefined)
    } else {
      callback(null, movies.map(function(movie) {
        return new Movie(movie)
      }))
    }
  })
}

Movie.topTen = function(callback) {
  db.run("SELECT * FROM movies ORDER BY votes DESC LIMIT 10;", function(error, movies) {
    if(error || !movies) {
      callback(error || new Error("Could not retrieve movies"), undefined)
    } else {
      callback(null, movies.map(function(movie) {
        return new Movie(movie)
      }))
    }
  })
}

module.exports = Movie
