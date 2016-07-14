var Book = require("../models/book")

var BooksController = {

  index: function (req, res, next) {

    Book.all(function(error, books) {
      if(error) {
        var err = new Error("Error retrieving book list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        locals = {}
        locals.type = "Books"
        locals.media = books
        res.render ('index', { locals: locals })
      }
    })
  }

}

module.exports = BooksController
