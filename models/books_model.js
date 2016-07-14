var app = require("../app");
var db = app.get("db");

var Book = function(id, title, upvotes) {
  this.id = id;
  this.title = title;
  this.upvotes = upvotes;
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

Book.topTen = function(callback) {
  db.run("SELECT * FROM books ORDER BY upvotes DESC", 
    function(error, books) {
    if (error|| !books) {
      callback(error || new Error("Could not retrieve books"), undefined);
    } else {
      callback(null, books.map(function(book) {
        return new Book(book.id, book.title, book.upvotes);
      }))
    }
  })
}


module.exports = Book;
