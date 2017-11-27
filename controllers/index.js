var Books = require("../models/books_model");
var Albums = require("../models/albums_model");
var Movies = require("../models/movies_model");


var IndexController = {
	// get top 10 media with ranking, upvotes and title in desc order
	getIndex: function(req, res) {
		Movies.topTen(function(error, topMovies) {
			if(error) {
				var err = new Error("Could not retrieve movies");
				err.status = 404;
			} else {
				Albums.topTen(function(error, topAlbums) {
					if(error) {
						var err = new Error("Could not retrieve albums");
						err.status = 404;
					} else {
						Books.topTen(function(error, topBooks) {
							if(error) {
								var err = new Error("Could not retrieve books");
								err.status = 404;
							} else {
							console.log(topMovies)
							console.log(topAlbums)
							console.log(topBooks)
								res.render('index', { 
													movies: topMovies,
													books: topBooks,
													albums: topAlbums
											});
										}
								});
							}
					});
				}
			})
		},

	upvote: function(req, res) {
		var media = req.body.media == 'books' ? Books : 
		            req.body.media == 'albums' ? Albums :
		            Movies;

		media.upvote(req.params.id, function(error) {
			if(error=="Could not add to db") {
				res.status(404).send(error)
			} else if (error) {
				// var err = "Please try again"
				res.status(500).send(error)
			} else {
				console.log("final else")
				res.redirect('/' + req.body.media + '/' + req.params.id)
			}
		})
	},

	deleteMedia: function(req, res) {
		var media = req.body.media == 'books' ? Books : 
		            req.body.media == 'albums' ? Albums :
		            Movies;

		media.remove(req.params.id, function(error) {
			if(error=="Could not add to db") {
				res.status(404).send(error)
			} else if (error) {
				// var err = "Please try again"
				res.status(500).send(error)
			} else {
				console.log("final else")
				res.redirect('/' + req.body.media)
			}
		})
	},
}



module.exports = IndexController