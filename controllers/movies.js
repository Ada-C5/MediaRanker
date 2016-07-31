var Movie = require("../models/movie");

var MovieController = {
  all: function(req, res, next) {
    Movie.all(function(error, movies) {
        if(error) {
        var err = new Error("Error retrieving movies list:\n" + error.message);
        err.status = 500;
        next(err);
      } else {
          res.render('index', { title: 'Movies' , stuff: movies});
      }
    })
  },

  item: function(req, res, next) {
    Movie.item([Number(req.params.id)], function(error, item) {
      if(error) {
      var err = new Error("Error retrieving movie:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        console.log(item)
        res.render('item', { title: 'Movies' , person: 'Director', stuff: item});
      }
    })
  },

  upvote: function(req, res, next) {
    Movie.upvote([Number(req.params.id)], function(error, item) {
      if(error) {
      var err = new Error("Error retrieving movie:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        Movie.item([Number(req.params.id)], function(error, item) {
          if(error) {
          var err = new Error("Error retrieving movie:\n" + error.message);
          err.status = 500;
          next(err);
          } else {
            res.redirect('http://localhost:3000/movies/'+req.params.id);
          }
        })
      }
    })
  },

  edit: function(req, res, next) {
    Movie.item([Number(req.params.id)], function(error, item) {
      if(error) {
      var err = new Error("Error retrieving movie:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        console.log(item)
        res.render('edit', { title: 'Movies', person: "Director", stuff: item});
      }
    })
  },

  saveedit: function(req, res, next) {
    // console.log(req.body)
    Movie.saveedit([req.body.id, req.body.name, req.body.person, req.body.description], function(error, item) {
      if(error) {
      var err = new Error("Error retrieving movie:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        Movie.item([Number(req.params.id)], function(error, item) {
          if(error) {
          var err = new Error("Error retrieving movie:\n" + error.message);
          err.status = 500;
          next(err);
          } else {
            res.redirect('http://localhost:3000/movies/'+req.body.id);
          }
        })
      }
    })
  },

  delete: function(req, res, next) {
    console.log(req.params.id)
    Movie.delete([Number(req.params.id)], function(error, item) {
      if(error) {
      var err = new Error("Error deleting movie:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        // console.log(item)
        res.redirect('http://localhost:3000/movies');
      }
    })
  },

  new: function(req, res, next) {
    // console.log(req.body.name)
    Movie.new([req.body.name, req.body.person, req.body.description], function(error, item) {
      if(error) {
      var err = new Error("Error creating movie:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        console.log(item)
        res.redirect('http://localhost:3000/movies/'+item.id);
      }
    })
  }
}

module.exports = MovieController;
