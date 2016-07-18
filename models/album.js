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
  db.run("SELECT * FROM albums", function(error, albums) {
    if(error || !albums) {
      callback(error || new Error("Could not retrieve albums"), undefined)
    } else {
      callback(null, albums.map(function(album) {
        return new Album(album)
      }))
    }
  })
}

Album.topTen = function(callback) {
  db.run("SELECT * FROM albums ORDER BY votes DESC LIMIT 10", function(error, albums) {
    if(error || !albums) {
      callback(error || new Error("Could not retrieve albums"), undefined)
    } else {
      callback(null, albums.map(function(album) {
        return new Album(album)
      }))
    }
  })
}

module.exports = Album
