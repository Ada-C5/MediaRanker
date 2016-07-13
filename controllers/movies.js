var Movies = require("../models/movies_model");


var MoviesController = {
	getMovies: function(req, res) {
		res.render('movies', { title: 'Movie List' });
	}
}

// {
// 	getMovies: function(req, res) {
// 		Movie.all(function(error, movies) {
// 			if(error=="Could not retrieve movies") {
// 				res.status(404).send(error)
// 			} else if (error) {
// 				var err = "Please try again"
// 				res.status(500).send(err)
// 			} else {
// 				res.render('movies', { 
// 					title: 'Movies List',
// 					movies: movies
// 				});
// 			}
// 		})
// 	}
// }

module.exports = MoviesController
