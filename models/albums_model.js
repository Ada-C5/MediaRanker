var app = require("../app");
var db = app.get("db");

var Movie = function(id) {
  this.id = id;
}

Movie.all = function(callback) {
  db.movies.find(function(error, movies) {
  //   if (error|| !customers) {
  //     callback(error || new Error("Could not retrieve customers"), undefined);
  //   } else {
  //     callback(null, customers.map(function(customer) {
  //       return new Customer(customer.id);
  //     }))
  //   };
  })
};



module.exports = Movie;
