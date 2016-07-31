var Album = require("../models/album");

var AlbumController = {
  all: function(req, res, next) {
    Album.all(function(error, albums) {
        if(error) {
        var err = new Error("Error retrieving albums list:\n" + error.message);
        err.status = 500;
        next(err);
      } else {
          res.render('index', { title: 'Albums' , stuff: albums});
      }
    });
  },

  item: function(req, res, next) {
    Album.item([Number(req.params.id)], function(error, item) {
      if(error) {
      var err = new Error("Error retrieving album:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        // console.log(item)
        res.render('item', { title: 'Albums' , person: 'Artist', stuff: item});
      }
    })
  },

  upvote: function(req, res, next) {
    Album.upvote([Number(req.params.id)], function(error, item) {
      if(error) {
      var err = new Error("Error retrieving album:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        Album.item([Number(req.params.id)], function(error, item) {
          if(error) {
          var err = new Error("Error retrieving album:\n" + error.message);
          err.status = 500;
          next(err);
          } else {
            res.redirect('http://localhost:3000/albums/'+req.params.id);
          }
        })
      }
    })
  },

  edit: function(req, res, next) {
    Album.item([Number(req.params.id)], function(error, item) {
      if(error) {
      var err = new Error("Error retrieving album:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        console.log(item)
        res.render('edit', { title: 'Albums', person: "Artist", stuff: item});
      }
    })
  },

  saveedit: function(req, res, next) {
    // console.log(req.body)
    Album.saveedit([req.body.id, req.body.name, req.body.person, req.body.description], function(error, item) {
      if(error) {
      var err = new Error("Error retrieving album:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        Album.item([Number(req.params.id)], function(error, item) {
          if(error) {
          var err = new Error("Error retrieving album:\n" + error.message);
          err.status = 500;
          next(err);
          } else {
            res.redirect('http://localhost:3000/albums/'+req.body.id);
          }
        })
      }
    })
  },

  delete: function(req, res, next) {
    Album.delete([Number(req.params.id)], function(error, item) {
      if(error) {
      var err = new Error("Error retrieving album:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        // console.log(item)
        res.redirect('http://localhost:3000/albums');
      }
    })
  },

  new: function(req, res, next) {
    Album.new([req.body.name, req.body.person, req.body.description], function(error, item) {
      if(error) {
      var err = new Error("Error creating album:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        console.log(item)
        res.redirect('http://localhost:3000/albums/'+item.id);
      }
    })
  }
}


module.exports = AlbumController;
