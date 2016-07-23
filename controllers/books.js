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
        locals.displayType = "Book"
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
  },

  edit: function (req, res, next) {

    console.log("boop: ", req.params.book_id)
    var book_id = req.params.book_id

    Book.find(book_id, function(error, books) {
      if(error) {
        var err = new Error("Error retrieving book:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        var locals = {}
        locals.type = "books"
        locals.madeBy = "Directed"
        locals.media = books[0]
        res.render ('edit', { locals: locals })
      }
    })
  },

  update: function (req, res, next) {
    var book_id = req.body.books_id
    var name = req.body.name
    var description = req.body.description
    var director = req.body.by

    Book.update([name, description, director, book_id], function(error, id) {
      if(error) {
        var err = new Error("Error retrieving book list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        res.redirect (200, '/books/' + book_id)
      }
    })
  },

  delete: function (req, res, next) {
    var book_id = req.body.delete

    Book.delete(book_id, function(error, id) {
      if(error) {
        var err = new Error("Error retrieving book list:\n" + error.message)
        err.status = 500
        next(err)
      } else {
        res.redirect (200, '/books')
      }
    })
  }

}

module.exports = BooksController
