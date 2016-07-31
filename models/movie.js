var app = require("../app");
var db = app.get("db");

var Movie = function (movie) {
  this.id = movie.id;
  this.type = movie.type;
  this.name = movie.name;
  this.person = movie.director;
  this.description = movie.description;
  this.votes = movie.votes;
};

Movie.all = function(callback) {
  db.query("SELECT * FROM movies ORDER BY votes desc;", function(error, movies) {
    if(error || !movies) {
      callback(error || new Error("Could not retrieve movies"), undefined);
    } else {
      callback(null, movies.map(function(movie) {
        return new Movie(movie);
      }))
    }
  })
}

Movie.item = function(id, callback) {
  db.query("SELECT * FROM movies WHERE id=$1", id, function(error, item) {
    if(error || !item) {
      callback(error || new Error("Could not retrieve movie"), undefined);
    } else {
      var oneItem = item.map(function(item) {
        return new Movie(item);
      });
      callback(null, oneItem);
    }
  })
}

Movie.upvote = function(id, callback) {
  db.query("UPDATE movies SET votes = votes+1 WHERE id=$1;", id, function(error, item) {
    if(error || !item) {
      callback(error || new Error("Could not retrieve movie"), undefined);
    } else {
      var oneItem = item.map(function(item) {
        return new Movie(item);
      });
      callback(null, oneItem);
    }
  })
}


Movie.saveedit = function(params, callback) {
  db.movies.update({id: params[0], name: params[1], director: params[2], description: params[3]},function(error, item) {
    if(error || !item) {
      callback(error || new Error("Could not retrieve movie"), undefined);
    } else {
      callback(null, item);
    }
  })
}

Movie.delete = function(ids, callback) {
  db.movies.destroy({id: ids}, function(error, item) {
    if(error || !item) {
      callback(error || new Error("Could not delete movie"), undefined);
    } else {
      callback(null, item);
    }
  })
}

Movie.new = function(params, callback) {
  db.movies.insert({name: params[0], director: params[1], description: params[2], type: 'movies', votes: 0},function(error, item) {
    if(error || !item) {
      callback(error || new Error("Could not retrieve movie"), undefined);
    } else {
      callback(null, item);
    }
  })
}



module.exports = Movie;
