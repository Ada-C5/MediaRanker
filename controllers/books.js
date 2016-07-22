var Books = require("../models/books_model");


var BooksController = {
	getBooks: function(req, res) {
		Books.all(function(error, books) {
			if(error=="Could not retrieve books") {
				res.status(404).send(error)
			} else if (error) {
				var err = "Please try again"
				res.status(500).send(err)
			} else {
				console.log(books)
				res.render('books', { 
					title: 'Books List',
					books: books
				});
			}
		})
	},

	getBook: function(req, res) {
		// need book object to render
		console.log(req.body)
		res.render('book')
	}
}

module.exports = BooksController
