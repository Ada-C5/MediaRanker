var app = require("../app");
var db = app.get("db");

var Book = function(id) {
  this.id = id;
}

Book.all = function(callback) {
  db.books.find(function(error, book) {
  //   if (error|| !customers) {
  //     callback(error || new Error("Could not retrieve customers"), undefined);
  //   } else {
  //     callback(null, customers.map(function(customer) {
  //       return new Customer(customer.id);
  //     }))
  //   };
  })
};



module.exports = Book;
