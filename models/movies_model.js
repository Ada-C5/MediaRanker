var app = require("../app");
var db = app.get("db");

var Movie = function(id, title) {
  this.id = id;
  this.title = title;
  this.ranking = 0;
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



module.exports = Movie;
