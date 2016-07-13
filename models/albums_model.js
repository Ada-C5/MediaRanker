var app = require("../app");
var db = app.get("db");

var Album = function(id, title) {
  this.id = id;
  this.title = title;
  this.ranking = 0;
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



module.exports = Album;
