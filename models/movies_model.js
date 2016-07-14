var app = require("../app");
var db = app.get("db");

var Movie = function(id, title, upvotes) {
  this.id = id;
  this.title = title;
  this.upvotes = upvotes;
}

Movie.all = function(callback) {
  db.movies.find(function(error, movies) {
      console.log("abloohaloo")
    if (error|| !movies) {
      callback(error || new Error("Could not retrieve movies"), undefined);
    } else {
      callback(null, movies.map(function(movie) {
        return new Movie(movie.id, movie.title);
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
}




module.exports = Movie;
