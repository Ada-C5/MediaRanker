var express = require('express')
var router = express.Router()
var AlbumsController = require('../controllers/albums.js')

router.get('/:album_id', AlbumsController.show)

/* GET albums listing. */
router.get('/', AlbumsController.index)

router.post('/', AlbumsController.upvote)
module.exports = router
