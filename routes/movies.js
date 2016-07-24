var express = require('express')
var router = express.Router()
var MoviesController = require('../controllers/movies.js')

/* New form for a movie */
router.get('/new', MoviesController.new)
/* Edit form for a movie */
router.get('/:movie_id/edit', MoviesController.edit)
/* GET one movie */
router.get('/:movie_id', MoviesController.show)
/* GET movies listing. */
router.get('/', MoviesController.index)

/* Delete a movie */
router.post('/delete', MoviesController.delete)
/* Upvote a movie */
router.post('/upvote', MoviesController.upvote)
/* Update a movie */
router.post('/:movie_id', MoviesController.update)
router.post('/', MoviesController.add)

module.exports = router
