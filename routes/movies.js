var express = require('express')
var router = express.Router()
var MoviesController = require('../controllers/movies.js')

/* Edit form for a movie */
router.get('/:movie_id/edit', MoviesController.edit)
/* GET one movie */
router.get('/:movie_id', MoviesController.show)
/* GET movies listing. */
router.get('/', MoviesController.index)

/* Delete a movie */
router.post('/delete', MoviesController.delete)
/* Update a movie */
router.post('/update', MoviesController.update)
/* Upvote a movie */
router.post('/', MoviesController.upvote)

module.exports = router
