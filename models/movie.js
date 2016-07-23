var app = require("../app")
var db = app.get("db")

// Constructor function
var Movie = function (movie) {
  this.id = movie.id
  this.name = movie.name
  this.description = movie.description
  this.by = movie.director
  this.votes = movie.votes
}

Movie.all = function (callback) {
  db.run("SELECT * FROM movies ORDER BY votes DESC;", function (error, movies) {
    if(error || !movies) {
      callback(error || new Error("Could not retrieve movies"), undefined)
    } else {
      callback(null, movies.map(function (movie) {
        return new Movie(movie)
      }))
    }
  })
}

Movie.find = function (input, callback) {
  db.movies.find({id: input}, function (error, movies) {
    if(error || !movies) {
      callback(error || new Error("Could not retrieve movie"), undefined)
    } else {
      callback(null, movies.map(function (movie) {
        return new Movie(movie)
      }))
    }
  })
}

Movie.topTen = function (callback) {
  db.run("SELECT * FROM movies ORDER BY votes DESC LIMIT 10;", function (error, movies) {
    if(error || !movies) {
      callback(error || new Error("Could not retrieve movies"), undefined)
    } else {
      callback(null, movies.map(function (movie) {
        return new Movie(movie)
      }))
    }
  })
}

Movie.addVote = function (id, callback) {
  db.run("UPDATE movies SET votes=votes+1 WHERE id=$1;", [id], function (error, movie) {
    movie_id = id
    if(error || !movie) {
      callback(error || new Error("Could not retrieve movies"), undefined)
    } else {
      callback(null, movie_id)
    }
  })
}

Movie.update = function (input, callback) {
  db.run("UPDATE movies SET name=$1, description=$2, director=$3 WHERE id=$4;", input, function (error, movie) {
    movie_id = input[3]
    if(error || !movie) {
      callback(error || new Error("Could not retrieve movies"), undefined)
    } else {
      callback(null, movie_id)
    }
  })
}

Movie.delete = function (id, callback) {
  db.run("DELETE FROM movies WHERE id=$1;", [id], function (error, movie) {
    if(error || !movie) {
      callback(error || new Error("Could not retrieve movies"), undefined)
    } else {
      callback(null, id)
    }
  })
}

module.exports = Movie
