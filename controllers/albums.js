var Album = require("../models/album")

var AlbumsController = {
  index: function (req, res, next) {

    Album.all(function(error, albums) {
      if(error) {
        var err = new Error("Error retrieving book list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        var locals = {}
        locals.type = "Albums"
        locals.media = albums
        res.render ('index', { locals: locals })
      }
    })
  },

  show: function (req, res, next) {
    var id = req.params.album_id

    Album.find(id, function(error, albums) {
      if(error) {
        var err = new Error("Error retrieving book list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        var locals = {}
        locals.type = "Albums"
        locals.media = albums[0]
        res.render ('albums/show', { locals: locals })
      }
    })
  },

  upvote: function (req, res, next) {
    var album_id = req.body.upvote

    Album.addVote(album_id, function(error, moe_id) {
      if(error) {
        var err = new Error("Error retrieving book list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        res.redirect (200, '/albums/' + album_id)
      }
    })
  }
}

module.exports = AlbumsController
