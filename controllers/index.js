var Books = require("../models/books_model");
var Albums = require("../models/albums_model");
var Movies = require("../models/movies_model");


var IndexController = {
	// get top 10 media with ranking, upvotes and title in desc order
	getIndex: function(req, res) {
		Movies.all(function(error, topMovies) {
			if(error) {
				var err = new Error("Could not retrieve movies");
				err.status = 404;
			} else {
				Albums.all(function(error, topAlbums) {
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
		}
}

module.exports = IndexController