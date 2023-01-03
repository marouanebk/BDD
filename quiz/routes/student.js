var express = require('express');
var router = express.Router()
const studentController  = require('../controller/studentController');


router.get('/getallquiz',studentController.getallquiz),
router.get('/getallquestion/:id',studentController.getAllQuestion);

module.exports = router