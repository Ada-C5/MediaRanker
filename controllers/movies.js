var Movies = require("../models/movies_model");


var MoviesController = {
	getMovies: function(req, res) {
		Movies.all(function(error, movies) {
			if(error=="Could not retrieve movies") {
				res.status(404).send(error)
			} else if (error) {
				var err = "Please try again"
				res.status(500).send(err)
			} else {
				console.log(movies)
				res.render('movies', { 
					title: 'Movies List',
					movies: movies
				});
			}
		})
	},

	getMovie: function(req, res) {
		Movies.find(req.params.id, function(error, movie) {
			if(error=="Could not retrieve movie") {
				res.status(404).send(error)
			} else if (error) {
				var err = "Please try again"
				res.status(500).send(err)
			} else {
					res.render('movie', { 
						id: movie.id,
						title: movie.title,
						director: movie.director,
						overview: movie.overview,
						upvotes: movie.upvotes
					});
			}
		})
	}
}

module.exports = MoviesController
