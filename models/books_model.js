var app = require("../app");
var db = app.get("db");

var Book = function(id, title) {
  this.id = id;
  this.title = title;
  this.ranking = 0;
}

Book.all = function(callback) {
  db.books.find(function(error, books) {
    if (error|| !books) {
      callback(error || new Error("Could not retrieve books"), undefined);
    } else {
      callback(null, books.map(function(book) {
        return new Book(book.id, book.title);
      }))
    };
  })
};


module.exports = Book;
