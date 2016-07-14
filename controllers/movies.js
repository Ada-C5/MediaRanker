var Movie = require("../models/movie")

var MoviesContoller = {

  index: function (req, res, next) {

    Movie.all(function(error, movies) {
      // console.log(movies[0].name)
      if(error) {
        var err = new Error("Error retrieving book list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        locals = {}
        locals.media = movies
        res.render ('books/index', { locals: locals })
      }
    })
  }

}

module.exports = MoviesContoller
