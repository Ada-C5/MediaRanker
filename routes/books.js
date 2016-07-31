var express = require('express');
var router = express.Router();
var Books = require('../controllers/books')


/* GET home page. */
router.get('/', Books.all);

router.get('/new', function(req, res, next) {
  res.render('addnew', { thing: 'Books', person: 'Author'});
});

router.post('/new', Books.new);

router.get('/:id', Books.item);

router.post('/:id', Books.upvote);

router.get('/:id/edit', Books.edit);

router.post('/:id/edit', Books.saveedit);

router.post('/:id/delete', Books.delete);


module.exports = router;
