var express = require('express')
var router = express.Router()
var MoviesController = require('../controllers/movies.js')

router.get('/:movie_id/edit', MoviesController.edit)
router.get('/:movie_id', MoviesController.show)
/* GET movies listing. */
router.get('/', MoviesController.index)
/* Upvote a movie */
router.post('/', MoviesController.upvote)


module.exports = router
