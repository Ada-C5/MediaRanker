var Albums = require("../models/albums_model");


var AlbumsController = {
	getAlbums: function(req, res) {
		Albums.all(function(error, albums) {
			if(error=="Could not retrieve albums") {
				res.status(404).send(error)
			} else if (error) {
				var err = "Please try again"
				res.status(500).send(err)
			} else {
				console.log(albums)
				res.render('albums', { 
					title: 'Albums List',
					albums: albums
				});
			}
		})
	},

	getAlbum: function(req, res) {
		res.render()
	}
}
module.exports = AlbumsController
