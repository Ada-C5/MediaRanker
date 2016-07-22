var app = require("../app")
var db = app.get("db")

// Constructor function
var Book = function (book) {
  this.id = book.id
  this.name = book.name
  this.description = book.description
  this.by = book.author
  this.votes = book.votes
}

Book.all = function (callback) {
  db.run("SELECT * FROM books ORDER BY votes DESC;", function (error, books) {
    if(error || !books) {
      callback(error || new Error("Could not retrieve books"), undefined)
    } else {
      callback(null, books.map(function (book) {
        return new Book(book)
      }))
    }
  })
}

Book.find = function (input, callback) {
  db.books.find({id: input}, function (error, books) {
    if(error || !books) {
      callback(error || new Error("Could not retrieve book"), undefined)
    } else {
      callback(null, books.map(function (book) {
        return new Book(book)
      }))
    }
  })
}

Book.topTen = function (callback) {
  db.run("SELECT * FROM books ORDER BY votes DESC LIMIT 10;", function (error, books) {
    if(error || !books) {
      callback(error || new Error("Could not retrieve books"), undefined)
    } else {
      callback(null, books.map(function (book) {
        return new Book(book)
      }))
    }
  })
}

Book.addVote = function (input, callback) {
  db.run("UPDATE books SET votes=votes+1 WHERE id=$1;", [input], function (error, book) {
    book_id = input
    if(error || !book) {
      callback(error || new Error("Could not retrieve books"), undefined)
    } else {
      callback(null, book_id)
    }
  })
}

Book.update = function (input, callback) {
  db.run("UPDATE books SET name=$1, description=$2, author=$3 WHERE id=$4;", input, function (error, book) {
    book_id = input[3]
    if(error || !book) {
      callback(error || new Error("Could not retrieve books"), undefined)
    } else {
      callback(null, book_id)
    }
  })
}

Book.delete = function (id, callback) {
  db.run("DELETE FROM books WHERE id=$1;", [id], function (error, book) {
    if(error || !book) {
      callback(error || new Error("Could not retrieve books"), undefined)
    } else {
      callback(null, id)
    }
  })
}

module.exports = Book
