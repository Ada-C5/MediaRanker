var app = require("../app");
var db = app.get("db");

var Movie = function(id, title, upvotes, director, overview) {
  this.id = id;
  this.title = title;
  this.upvotes = upvotes;
  this.director = director;
  this.overview = overview;
}

Movie.all = function(callback) {
  db.movies.find(function(error, movies) {
      console.log("abloohaloo")
    if (error|| !movies) {
      callback(error || new Error("Could not retrieve movies"), undefined);
    } else {
      callback(null, movies.map(function(movie) {
        return new Movie(movie.id, movie.title, movie.upvotes);
      }))
    };
  })
};

Movie.topTen = function(callback) {
  db.run("SELECT * FROM movies ORDER BY upvotes DESC", 
    function(error, movies) {
    if (error|| !movies) {
      callback(error || new Error("Could not retrieve movies"), undefined);
    } else {
      callback(null, movies.map(function(movie) {
        return new Movie(movie.id, movie.title, movie.upvotes);
      }))
    }
  })
};

Movie.upvote = function(id, callback) {
  db.run("UPDATE movies SET upvotes = upvotes + 1 WHERE id = $1", [id], 
    function(error, movie) {
    if (error|| !movie) {
      callback(error || new Error("Could not add to db"));
    } else {
      callback(null)
    }
  })
};

Movie.find = function(id, callback) {
  db.movies.findOne({id: id}, function(error, movie) {
    if (error || !movie) {
      callback(error || new Error("Could not retrieve movie"), undefined);
    } else {
      movie = new Movie(movie.id, movie.title, movie.upvotes, movie.director, movie.overview)
      callback(null, movie)
    }
  })
};

Movie.remove = function(id, callback) {
  db.movies.destroy({id: id}, function(error, movie) {
    if (error || !movie) {
      callback(error || new Error("Could not delete movie"));
    } else {
      callback(null)
    }
  })
};

module.exports = Movie;
