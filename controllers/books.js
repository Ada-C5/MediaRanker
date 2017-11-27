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
				res.render('books', { 
					title: 'Books List',
					books: books
				});
			}
		})
	},

	getBook: function(req, res) {
		Books.find(req.params.id, function(error, book) {
			if(error=="Could not retrieve book") {
				res.status(404).send(error)
			} else if (error) {
				var err = "Please try again"
				res.status(500).send(err)
			} else {
					res.render('book', { 
						id: book.id,
						title: book.title,
						author: book.author,
						overview: book.overview,
						upvotes: book.upvotes
					});
			}
		})
	},

		editBook: function(req, res) {
		Books.find(req.params.id, function(error, book) {
			if(error=="Could not retrieve book") {
				res.status(404).send(error)
			} else if (error) {
				var err = "Please try again"
				res.status(500).send(err)
			} else {
					res.render('editbook', { 
						id: book.id,
						title: book.title,
						author: book.author,
						overview: book.overview,
						upvotes: book.upvotes
					});
			}
		})
	},

	updateBook: function(req, res) {
		Books.update(req.params.id, req.query.author, req.query.overview, req.query.title, function(error, book) {
			if(error=="Could not retrieve book") {
				res.status(404).send(error)
			} else if (error) {
				var err = "Please try again"
				res.status(500).send(err)
			} else {
				res.redirect('/books/' + req.params.id)
			}
		})
	}
}

module.exports = BooksController
