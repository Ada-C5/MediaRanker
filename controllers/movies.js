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
  }

}

module.exports = MoviesContoller
