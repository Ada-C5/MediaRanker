var express = require('express');
var router = express.Router();
var Index = require('../controllers/index')


/* GET home page. */
// router.get('/', function(req, res, next) {
//   res.render('index', { title: 'Express' });
// });

router.get('/', Index.all);


// router.get('/', Controller.)
module.exports = router;
