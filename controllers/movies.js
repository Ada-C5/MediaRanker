var Movie = require("../models/movie")

var MoviesContoller = {

  index: function (req, res, next) {

    Movie.all(function(error, movies) {
      if(error) {
        var err = new Error("Error retrieving book list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        var locals = {}
        locals.type = "Movies"
        locals.media = movies
        res.render ('index', { locals: locals })
      }
    })
  },

  show: function (req, res, next) {
    var id = 3

    Movie.find(id, function(error, movies) {
      if(error) {
        var err = new Error("Error retrieving book list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        var locals = {}
        locals.type = "Movies"
        locals.media = movies
        res.render ('index', { locals: locals })
      }
    })
  },

  upvote: function (req, res, next) {
    console.log("goop: ", req.params)
    // var movie_id = req.params.movie_id
    var movie_id = 1

    Movie.addVote(movie_id, function(error, moe_id) {
      if(error) {
        var err = new Error("Error retrieving book list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        var locals = {}
        locals.type = "Movies"
        locals.id = moe_id
        res.redirect (200, '/movies/' + movie_id)
      }
    })
  }

}

module.exports = MoviesContoller
