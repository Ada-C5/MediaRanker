var Book = require("../models/book")

var BooksController = {

  index: function (req, res, next) {

    Book.all(function(error, books) {
      // console.log(books[0].name)
      if(error) {
        var err = new Error("Error retrieving book list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        locals = {}
        locals.books = books
        res.render ('books/index', { locals: locals })
      }
    })
  }

}

module.exports = BooksController
