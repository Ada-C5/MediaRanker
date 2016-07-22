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
		Albums.find(req.params.id, function(error, album) {
			if(error=="Could not retrieve album") {
				res.status(404).send(error)
			} else if (error) {
				var err = "Please try again"
				res.status(500).send(err)
			} else {
					res.render('album', { 
						id: album.id,
						title: album.title,
						artist: album.artist,
						overview: album.overview,
						upvotes: album.upvotes
					});
			}
		})
	},

	editAlbum: function(req, res) {
		Albums.find(req.params.id, function(error, album) {
			if(error=="Could not retrieve album") {
				res.status(404).send(error)
			} else if (error) {
				var err = "Please try again"
				res.status(500).send(err)
			} else {
					res.render('editAlbum', { 
						id: album.id,
						title: album.title,
						artist: album.artist,
						overview: album.overview,
						upvotes: album.upvotes
					});
			}
		})
	},

	updateAlbum: function(req, res) {
		Albums.update(req.params.id, req.query.artist, req.query.overview, req.query.title, function(error, album) {
			if(error=="Could not retrieve album") {
				res.status(404).send(error)
			} else if (error) {
				var err = "Please try again"
				res.status(500).send(err)
			} else {
				console.log('cornbread')
					res.redirect('/albums/' + id)
			}
		})
	}
}
module.exports = AlbumsController
