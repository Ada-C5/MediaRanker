var Album = require("../models/album")

var AlbumsController = {
  index: function (req, res, next) {

    Album.all(function(error, albums) {
      // console.log(albums[0].name)
      if(error) {
        var err = new Error("Error retrieving book list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        locals = {}
        locals.media = albums
        res.render ('books/index', { locals: locals })
      }
    })
  }
}

module.exports = AlbumsController
