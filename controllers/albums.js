var Album = require("../models/album")

var AlbumsController = {
  index: function (req, res, next) {

    Album.all(function(error, albums) {
      if(error) {
        var err = new Error("Error retrieving book list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        locals = {}
        locals.type = "Albums"
        locals.media = albums
        res.render ('index', { locals: locals })
      }
    })
  }
}

module.exports = AlbumsController
