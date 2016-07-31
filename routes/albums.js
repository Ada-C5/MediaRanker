var express = require('express');
var router = express.Router();
var Albums = require('../controllers/albums')


/* GET home page. */
router.get('/', Albums.all);

router.get('/new', function(req, res, next) {
  res.render('addnew', { thing: 'Albums', person: 'Artist'});
});

router.post('/new', Albums.new);

router.get('/:id', Albums.item);

router.post('/:id', Albums.upvote);

router.get('/:id/edit', Albums.edit);

router.post('/:id/edit', Albums.saveedit);

router.post('/:id/delete', Albums.delete);

// router.get('/:id', Albums.item);


module.exports = router;
