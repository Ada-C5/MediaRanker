var express = require('express');
var router = express.Router();

/* GET albums listing. */
router.get('/', AlbumsController.index)

module.exports = router;
