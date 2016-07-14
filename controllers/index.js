var Books = require("../models/books_model");
var Albums = require("../models/albums_model");
var Movies = require("../models/movies_model");

var IndexController = {
	getIndex: function(req, res) {
		res.render('index', { title: 'Media Ranker' });
	}
}

module.exports = IndexController
