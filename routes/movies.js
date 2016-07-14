var express = require('express')
var router = express.Router()
var MoviesContoller = require('../controllers/movies.js')

/* GET movies listing. */
router.get('/', MoviesContoller.index)

module.exports = router
