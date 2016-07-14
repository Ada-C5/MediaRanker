var express = require('express')
var router = express.Router()
var AlbumsController = require('../controllers/albums.js')

/* GET albums listing. */
router.get('/', AlbumsController.index)

module.exports = router
