var express = require('express');
var router = express.Router();

/* GET movies listing. */
router.get('/', MoviesContoller.index)

module.exports = router;
