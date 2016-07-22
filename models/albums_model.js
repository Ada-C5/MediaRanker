var app = require("../app");
var db = app.get("db");

var Album = function(id, title, upvotes, artist, overview) {
  this.id = id;
  this.title = title;
  this.upvotes = upvotes;
  this.artist = artist;
  this.overview = overview;
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
};

Album.upvote = function(id, callback) {
  db.run("UPDATE albums SET upvotes = upvotes + 1 WHERE id = $1", [id], 
    function(error, album) {
    if (error|| !album) {
      callback(error || new Error("Could not add to db"));
    } else {
      callback(null)
    }
  })
};

Album.find = function(id, callback) {
  db.albums.findOne({id: id}, function(error, album) {
    if (error || !album) {
      callback(error || new Error("Could not retrieve album"), undefined);
    } else {
      album = new Album(album.id, album.title, album.upvotes, album.artist, album.overview)
      callback(null, album)
    }
  })
};

Album.remove = function(id, callback) {
  db.albums.destroy({id: id}, function(error, album) {
    if (error || !album) {
      callback(error || new Error("Could not delete album"));
    } else {
      callback(null)
    }
  })
};

Album.update = function(id, artist, overview, title, callback) {
  db.albums.update({id: id, artist: artist, overview: overview, title: title}, function(error, album) {
    if (error || !album) {
      callback(error || new Error("Could not update album"));
    } else {
      callback(null)
    }
  })
};


module.exports = Album;
