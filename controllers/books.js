var Book = require("../models/book")

var BooksController = {

  index: function (req, res, next) {

    Book.all(function(error, books) {
      if(error) {
        var err = new Error("Error retrieving book list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        var locals = {}
        locals.type = "books"
        locals.media = books
        res.render ('index', { locals: locals })
      }
    })
  },

  show: function (req, res, next) {
    var id = req.params.book_id

    Book.find(id, function(error, books) {
      if(error) {
        var err = new Error("Error retrieving book list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        var locals = {}
        locals.type = "books"
        locals.madeBy = "Written"
        locals.media = books[0]
        res.render ('show', { locals: locals })
      }
    })
  },

  upvote: function (req, res, next) {
    var book_id = req.body.upvote

    Book.addVote(book_id, function(error, moe_id) {
      if(error) {
        var err = new Error("Error retrieving book list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        res.redirect (200, '/books/' + book_id)
      }
    })
  }

}

module.exports = BooksController
