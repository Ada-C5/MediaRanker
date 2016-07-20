var express = require('express')
var router = express.Router()
var BooksController = require('../controllers/books.js')

/* Edit form for a book */
router.get('/:book_id/edit', BooksController.edit)
/* GET one book */
router.get('/:book_id', BooksController.show)
/* GET books listing. */
router.get('/', BooksController.index)

/* Update a book */
router.post('/update', BooksController.update)
/* Upvote a book */
router.post('/', BooksController.upvote)

module.exports = router
