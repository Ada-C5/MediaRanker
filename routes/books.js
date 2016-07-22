var express = require('express');
var router = express.Router();
var Controller = require('../controllers/books')
var indexController = require('../controllers/index')

router.get('/:id', Controller.getBook)
router.get('/', Controller.getBooks)
router.post('/:id/delete', indexController.deleteMedia)
router.post('/:id', indexController.upvote)


module.exports = router;
