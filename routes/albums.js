var express = require('express');
var router = express.Router();
var Controller = require('../controllers/albums')
var indexController = require('../controllers/index')

router.get('/:id', Controller.getAlbum)
router.get('/', Controller.getAlbums)
router.post('/:id/delete', indexController.deleteMedia)
router.post('/:id', indexController.upvote)

module.exports = router;
