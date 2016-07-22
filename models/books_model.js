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

Book.upvote = function(id, callback) {
  db.run("UPDATE books SET upvotes = upvotes + 1 WHERE id = $1", [id], 
    function(error, book) {
    if (error|| !book) {
      callback(error || new Error("Could not add to db"));
    } else {
      callback(null)
    }
  })
}


module.exports = Book;
