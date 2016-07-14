var express = require('express')
var router = express.Router()
var BooksController = require('../controllers/books.js')

/* GET books listing. */
router.get('/', BooksController.index)

module.exports = router
