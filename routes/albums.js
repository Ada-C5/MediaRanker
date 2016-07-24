var express = require('express')
var router = express.Router()
var AlbumsController = require('../controllers/albums.js')

// New form for a movie
router.get('/new', AlbumsController.new)
// Edit form for an album
router.get('/:album_id/edit', AlbumsController.edit)
// GET one album
router.get('/:album_id', AlbumsController.show)
// GET albums listing
router.get('/', AlbumsController.index)

/* Delete a album */
router.post('/delete', AlbumsController.delete)
// Upvote an album
router.post('/upvote', AlbumsController.upvote)
// Update an album
router.post('/:album_id', AlbumsController.update)
router.post('/', AlbumsController.add)

module.exports = router
