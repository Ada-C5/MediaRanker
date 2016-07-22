var express = require('express');
var router = express.Router();
var Controller = require('../controllers/books')
var indexController = require('../controllers/index')

router.post('/:id/delete', indexController.delete)
router.get('/:id', Controller.getBook)
// select all from db
router.get('/', Controller.getBooks)

router.post('/:id', indexController.upvote)

// router.get('/sort/:column', Controller.subsetCustomers)
// router.get('/:customer_id/current', Controller.getCustomersCurrent)
// router.get('/:customer_id/history', Controller.getCustomersHistory)


module.exports = router;
