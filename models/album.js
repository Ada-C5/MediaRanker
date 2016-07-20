var app = require("../app");
var db = app.get("db");

// Constructor function
var Album = function(album) {
  this.id = album.id
  this.name = album.name
  this.description = album.description
  this.by = album.author
  this.votes = album.votes
}

Album.all = function(callback) {
  db.run("SELECT * FROM albums ORDER BY votes;", function(error, albums) {
    if(error || !albums) {
      callback(error || new Error("Could not retrieve albums"), undefined)
    } else {
      callback(null, albums.map(function(album) {
        return new Album(album)
      }))
    }
  })
}

Album.find = function(input, callback) {
  db.albums.find({id: input}, function(error, albums) {
    if(error || !albums) {
      callback(error || new Error("Could not retrieve album"), undefined)
    } else {
      callback(null, albums.map(function(album) {
        return new Album(album)
      }))
    }
  })
}

Album.topTen = function(callback) {
  db.run("SELECT * FROM albums ORDER BY votes DESC LIMIT 10;", function(error, albums) {
    if(error || !albums) {
      callback(error || new Error("Could not retrieve albums"), undefined)
    } else {
      callback(null, albums.map(function(album) {
        return new Album(album)
      }))
    }
  })
}

Album.addVote = function(input, callback) {
  db.run("UPDATE albums SET votes=votes+1 WHERE id=$1;", [input], function(error, album) {
    album_id = input
    if(error || !album) {
      callback(error || new Error("Could not retrieve albums"), undefined)
    } else {
      callback(null, album_id)
    }
  })
}

Album.update = function(input, callback) {
  db.run("UPDATE albums SET name=$1, description=$2, artist=$3 WHERE id=$4;", input, function(error, album) {
    album_id = input[3]
    if(error || !album) {
      callback(error || new Error("Could not retrieve albums"), undefined)
    } else {
      callback(null, album_id)
    }
  })
}

Album.delete = function(id, callback) {
  db.run("DELETE FROM albums WHERE id=$1;", [id], function(error, album) {
    if(error || !album) {
      callback(error || new Error("Could not retrieve albums"), undefined)
    } else {
      callback(null, id)
    }
  })
}

module.exports = Album
