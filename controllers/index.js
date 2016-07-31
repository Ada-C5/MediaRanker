var Movie = require("../models/movie");
var Album = require("../models/album");
var Book = require("../models/book");

var IndexController = {
  all: function(req, res, next) {
    Movie.all(function(error, moviez) {
      if(error) {
      var err = new Error("Error retrieving movies list:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        Book.all(function(error, bookz) {
          if(error) {
          var err = new Error("Error retrieving books list:\n" + error.message);
          err.status = 500;
          next(err);
          } else {
            Album.all(function(error, albumz) {
              if(error) {
              var err = new Error("Error retrieving albums list:\n" + error.message);
              err.status = 500;
              next(err);
              } else {
                res.render('home', { title: 'All Media', movies: moviez, books: bookz, albums:albumz });
              }
            })
          }
        })
      }
    })
  }
}

module.exports = IndexController;
