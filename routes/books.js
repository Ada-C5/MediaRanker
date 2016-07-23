var express = require('express')
var router = express.Router()
var BooksController = require('../controllers/books.js')

/* Edit form for a book */
router.get('/:book_id/edit', BooksController.edit)
/* GET one book */
router.get('/:book_id', BooksController.show)
/* GET books listing. */
router.get('/', BooksController.index)

/* Delete a book */
router.post('/delete', BooksController.delete)
/* Upvote a book */
router.post('/upvote', BooksController.upvote)
/* Update a book */
router.post('/:book_id', BooksController.update)
router.post('/', BooksController.upvote)

module.exports = router
