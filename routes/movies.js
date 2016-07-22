var express = require('express');
var router = express.Router();
var Controller = require('../controllers/movies')
var indexController = require('../controllers/index')

router.get('/:id', Controller.getMovie)
router.get('/', Controller.getMovies)
router.post('/:id/delete', indexController.deleteMedia)
router.post('/:id', indexController.upvote)

module.exports = router;
