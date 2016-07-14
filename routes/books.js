var express = require('express');
var router = express.Router();

/* GET books listing. */
router.get('/', BooksController.index)

module.exports = router;
