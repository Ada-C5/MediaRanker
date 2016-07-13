var express = require('express');
var router = express.Router();
var Controller = require('../controllers/albums')

// select all from db
router.get('/', Controller.getAlbums)
// router.get('/sort/:column', Controller.subsetCustomers)
// router.get('/:customer_id/current', Controller.getCustomersCurrent)
// router.get('/:customer_id/history', Controller.getCustomersHistory)


module.exports = router;
