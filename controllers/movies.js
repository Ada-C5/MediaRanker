var Movie = require("../models/movie")

var MoviesContoller = {

  index: function (req, res, next) {

    Movie.all(function(error, movies) {
      if(error) {
        var err = new Error("Error retrieving movie list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        var locals = {}
        locals.type = "movies"
        locals.displayType = "Movie"
        locals.media = movies
        res.render ('index', { locals: locals })
      }
    })
  },

  show: function (req, res, next) {
    var id = req.params.movie_id

    Movie.find(id, function(error, movies) {
      if(error) {
        var err = new Error("Error retrieving movie list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        var locals = {}
        locals.type = "movies"
        locals.displayType = "Movie"
        locals.madeBy = "Directed"
        locals.media = movies[0]
        res.render ('show', { locals: locals })
      }
    })
  },

  upvote: function (req, res, next) {
    var movie_id = req.body.upvote

    Movie.addVote(movie_id, function(error, moe_id) {
      if(error) {
        var err = new Error("Error retrieving movie list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        return res.redirect ('/movies/' + movie_id)
      }
    })
  },

  edit: function (req, res, next) {
    var movie_id = req.params.movie_id

    Movie.find(movie_id, function(error, movies) {
      if(error) {
        var err = new Error("Error retrieving movie:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        var locals = {}
        locals.type = "movies"
        locals.displayType = "Movie"
        locals.madeBy = "Directed"
        locals.media = movies[0]
        res.render ('edit', { locals: locals })
      }
    })
  },

  new: function (req, res, next) {
    var locals = {}
    locals.type = "movies"
    locals.displayType = "Movie"
    locals.madeBy = "Directed"
    res.render ('new', { locals: locals })
},

  update: function (req, res, next) {
    var movie_id = req.body.movies_id
    var name = req.body.name
    var description = req.body.description
    var director = req.body.by

    Movie.update([name, description, director, movie_id], function(error, id) {
      if(error) {
        var err = new Error("Error retrieving movie list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        return res.redirect ('/movies/' + movie_id)
      }
    })
  },

  add: function (req, res, next) {
    var name = req.body.name
    var description = req.body.description
    var director = req.body.by

    Movie.create([name, description, director], function(error, movie) {
      console.log("boop: ", movie)
      if(error) {
        var err = new Error("Error retrieving movie list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        return res.redirect ('/movies/' + movie.id)
      }
    })
  },

  delete: function (req, res, next) {
    var movie_id = req.body.delete

    Movie.delete(movie_id, function(error, id) {
      if(error) {
        var err = new Error("Error retrieving movie list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        return res.redirect ('/movies')
      }
    })
  }

}

module.exports = MoviesContoller
