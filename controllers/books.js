var Book = require("../models/book")

var BooksController = {

  index = function () {
    locals = Book.all

    render ('books/index', locals)
  }

}

module.exports = BooksController
