var app = require("../app");
var db = app.get("db");

var Album = function(id, title, upvotes) {
  this.id = id;
  this.title = title;
  this.upvotes = upvotes;
}

Album.all = function(callback) {
  db.albums.find(function(error, albums) {
      console.log("abloohaloo")
    if (error|| !albums) {
      callback(error || new Error("Could not retrieve albums"), undefined);
    } else {
      callback(null, albums.map(function(album) {
        return new Album(album.id, album.title);
      }))
    };
  })
};

Album.topTen = function(callback) {
  db.run("SELECT * FROM albums ORDER BY upvotes DESC", 
    function(error, albums) {
    if (error|| !albums) {
      callback(error || new Error("Could not retrieve albums"), undefined);
    } else {
      callback(null, albums.map(function(album) {
        return new Album(album.id, album.title, album.upvotes);
      }))
    }
  })
}


module.exports = Album;
