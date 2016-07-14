var app = require("../app");
var db = app.get("db");

// Constructor function
var Book = function(book) {
  this.id = book.id
  this.name = book.name
  this.description = book.description
  this.by = book.author
  this.votes = book.votes
}

Book.all = function(callback) {
  db.run("SELECT * FROM books", function(error, books) {
    if(error || !books) {
      callback(error || new Error("Could not retrieve books"), undefined)
    } else {
      callback(null, books.map(function(book) {
        return new Book(book)
      }))
    }
  })
}

module.exports = Book
