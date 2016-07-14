var express = require('express');
var router = express.Router();
var Controller = require('../controllers/docs')

/* GET docs json. */
// router.get('/api/docs.json', Controller.getJsonDocs)

/* GET docs html page. */
// router.get('/api/docs', Controller.getDocs)


/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Scrabble Express' });
});


module.exports = router;


// 	{ 
// 	title: 'Movies List',
// 	movies: movies
// }