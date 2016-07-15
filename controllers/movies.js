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

	getBook: function(req, res) {
		res.render()
	}
}

module.exports = MoviesController
