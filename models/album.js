var app = require("../app");
var db = app.get("db");

var Album = function (album) {
  this.id = album.id;
  this.type = album.type;
  this.name = album.name;
  this.person = album.artist;
  this.description = album.description;
  this.votes = album.votes;
};

Album.all = function(callback) {
  db.query("SELECT * FROM albums ORDER BY votes desc;", function(error, albums) {
    if(error || !albums) {
      callback(error || new Error("Could not retrieve albums"), undefined);
    } else {
      callback(null, albums.map(function(album) {
        return new Album(album);
      }))
    }
  })
}

Album.item = function(id, callback) {
  db.query("SELECT * FROM albums WHERE id=$1", id, function(error, item) {
    if(error || !item) {
      callback(error || new Error("Could not retrieve album"), undefined);
    } else {
      var oneItem = item.map(function(item) {
        return new Album(item);
      });
      callback(null, oneItem);
    }
  })
}

Album.upvote = function(id, callback) {
  db.query("UPDATE albums SET votes = votes+1 WHERE id=$1;", id, function(error, item) {
    if(error || !item) {
      callback(error || new Error("Could not retrieve album"), undefined);
    } else {
      var oneItem = item.map(function(item) {
        return new Album(item);
      });
      callback(null, oneItem);
    }
  })
}

Album.saveedit = function(params, callback) {
  db.albums.update({id: params[0], name: params[1], artist: params[2], description: params[3]},function(error, item) {
    if(error || !item) {
      callback(error || new Error("Could not retrieve album"), undefined);
    } else {
      callback(null, item);
    }
  })
}

Album.delete = function(ids, callback) {
  db.albums.destroy({id: ids}, function(error, item) {
    if(error || !item) {
      callback(error || new Error("Could not retrieve album"), undefined);
    } else {
      callback(null, item);
    }
  })
}

Album.new = function(params, callback) {
  db.albums.insert({name: params[0], artist: params[1], description: params[2], type: 'albums', votes: 0},function(error, item) {
    if(error || !item) {
      callback(error || new Error("Could not retrieve album"), undefined);
    } else {
      callback(null, item);
    }
  })
}


module.exports = Album;
