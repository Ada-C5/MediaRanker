var app = require("../app");
var db = app.get("db");

var Book = function (book) {
  this.id = book.id;
  this.type = book.type;
  this.name = book.name;
  this.person = book.author;
  this.description = book.description;
  this.votes = book.votes;
};

Book.all = function(callback) {
  db.query("SELECT * FROM books ORDER BY votes desc;", function(error, books) {
    if(error || !books) {
      callback(error || new Error("Could not retrieve books"), undefined);
    } else {
      callback(null, books.map(function(book) {
        return new Book(book);
      }))
    }
  })
}


Book.item = function(id, callback) {
  db.query("SELECT * FROM books WHERE id=$1", id, function(error, item) {
    if(error || !item) {
      callback(error || new Error("Could not retrieve book"), undefined);
    } else {
      var oneItem = item.map(function(item) {
        return new Book(item);
      });
      callback(null, oneItem);
    }
  })
}

Book.upvote = function(id, callback) {
  db.query("UPDATE books SET votes = votes+1 WHERE id=$1;", id, function(error, item) {
    if(error || !item) {
      callback(error || new Error("Could not retrieve book"), undefined);
    } else {
      var oneItem = item.map(function(item) {
        return new Book(item);
      });
      callback(null, oneItem);
    }
  })
}

Book.saveedit = function(params, callback) {
  db.books.update({id: params[0], name: params[1], author: params[2], description: params[3]},function(error, item) {
    if(error || !item) {
      callback(error || new Error("Could not retrieve book"), undefined);
    } else {
      callback(null, item);
    }
  })
}

Book.delete = function(ids, callback) {
  db.books.destroy({id: ids}, function(error, item) {
    if(error || !item) {
      callback(error || new Error("Could not delete book"), undefined);
    } else {
      callback(null, item);
    }
  })
}

Book.new = function(params, callback) {
  db.books.insert({name: params[0], author: params[1], description: params[2], type: 'books', votes: 0},function(error, item) {
    if(error || !item) {
      callback(error || new Error("Could not retrieve book"), undefined);
    } else {
      callback(null, item);
    }
  })
}

module.exports = Book;
