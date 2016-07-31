var Book = require("../models/book");

var BookController = {
  all: function(req, res, next) {
    Book.all(function(error, books) {
        if(error) {
        var err = new Error("Error retrieving books list:\n" + error.message);
        err.status = 500;
        next(err);
      } else {
          res.render('index', { title: 'Books' , stuff: books});
      }
    });
  },

  item: function(req, res, next) {
    Book.item([Number(req.params.id)], function(error, item) {
      if(error) {
      var err = new Error("Error retrieving book:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        console.log(item)
        res.render('item', { title: 'Books' , person: 'Author', stuff: item});
      }
    })
  },

  upvote: function(req, res, next) {
    Book.upvote([Number(req.params.id)], function(error, item) {
      if(error) {
      var err = new Error("Error retrieving book:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        Book.item([Number(req.params.id)], function(error, item) {
          if(error) {
          var err = new Error("Error retrieving book:\n" + error.message);
          err.status = 500;
          next(err);
          } else {
            res.redirect('http://localhost:3000/books/'+req.params.id);
          }
        })
      }
    })
  },

  edit: function(req, res, next) {
    Book.item([Number(req.params.id)], function(error, item) {
      if(error) {
      var err = new Error("Error retrieving book:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        console.log(item)
        res.render('edit', { title: 'Books', person: "Author", stuff: item});
      }
    })
  },

  saveedit: function(req, res, next) {
    // console.log(req.body)
    Book.saveedit([req.body.id, req.body.name, req.body.person, req.body.description], function(error, item) {
      if(error) {
      var err = new Error("Error retrieving book:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        Book.item([Number(req.params.id)], function(error, item) {
          if(error) {
          var err = new Error("Error retrieving book:\n" + error.message);
          err.status = 500;
          next(err);
          } else {
            res.redirect('http://localhost:3000/books/'+req.body.id);
          }
        })
      }
    })
  },

  delete: function(req, res, next) {
    Book.delete([Number(req.params.id)], function(error, item) {
      if(error) {
      var err = new Error("Error retrieving book:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        // console.log(item)
        res.redirect('http://localhost:3000/books');
      }
    })
  },

  new: function(req, res, next) {
    // console.log(req.body.name)
    Book.new([req.body.name, req.body.person, req.body.description], function(error, item) {
      if(error) {
      var err = new Error("Error creating book:\n" + error.message);
      err.status = 500;
      next(err);
      } else {
        console.log(item)
        res.redirect('http://localhost:3000/books/'+item.id);
      }
    })
  }

}

module.exports = BookController;
