var express = require('express');
var router = express.Router();
var Movies = require('../controllers/movies')

/* GET home page. */
router.get('/', Movies.all);

router.get('/new', function(req, res, next) {
  res.render('addnew', { thing: 'Movies', person: 'Director'});
});

router.post('/new', Movies.new);

router.get('/:id', Movies.item);

router.post('/:id', Movies.upvote);

router.get('/:id/edit', Movies.edit);

router.post('/:id/edit', Movies.saveedit);

router.post('/:id/delete', Movies.delete);

// {
//   res.redirect('/test');
// });

module.exports = router;
