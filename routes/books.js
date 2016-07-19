var express = require('express')
var router = express.Router()
var BooksController = require('../controllers/books.js')

/* GET books listing. */
router.get('/:book_id', BooksController.show)
router.get('/', BooksController.index)

router.post('/', BooksController.upvote)

module.exports = router
