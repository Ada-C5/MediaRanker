var app = require("../app");
var db = app.get("db");

var Book = function(id, title, upvotes, author, overview) {
  this.id = id;
  this.title = title;
  this.upvotes = upvotes;
  this.author = author;
  this.overview = overview;
}

Book.all = function(callback) {
  db.books.find(function(error, books) {
    if (error|| !books) {
      callback(error || new Error("Could not retrieve books"), undefined);
    } else {
      callback(null, books.map(function(book) {
        return new Book(book.id, book.title, book.upvotes);
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
        return new Book(book.id, book.title, book.upvotes, book.author);
      }))
    }
  })
};

Book.upvote = function(id, callback) {
  db.run("UPDATE books SET upvotes = upvotes + 1 WHERE id = $1", [id], 
    function(error, book) {
    if (error|| !book) {
      callback(error || new Error("Could not add to db"));
    } else {
      callback(null)
    }
  })
};

Book.find = function(id, callback) {
  db.books.findOne({id: id}, function(error, book) {
    if (error || !book) {
      callback(error || new Error("Could not retrieve book"), undefined);
    } else {
      book = new Book(book.id, book.title, book.upvotes, book.author, book.overview)
      callback(null, book)
    }
  })
};

Book.remove = function(id, callback) {
  db.books.destroy({id: id}, function(error, book) {
    if (error || !book) {
      callback(error || new Error("Could not delete book"));
    } else {
      callback(null)
    }
  })
};

Book.remove = function(id, callback) {
  db.books.destroy({id: id}, function(error, book) {
    if (error || !book) {
      callback(error || new Error("Could not delete book"));
    } else {
      callback(null)
    }
  })
};

Book.update = function(id, author, overview, title, callback) {
  db.books.update({id: id, author: author, overview: overview, title: title}, function(error, book) {
    if (error || !book) {
      callback(error || new Error("Could not update book"));
    } else {
      callback(null)
    }
  })
};


module.exports = Book;
