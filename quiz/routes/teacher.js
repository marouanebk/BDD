var express = require('express');
var router = express.Router();
const teacherController  = require('../controller/teacherController');




router.post('/createquiz' ,teacherController.createQuiz),
router.get('/getadquiz',teacherController.getquiz),
router.delete('/deletequiz/:id', teacherController.deleteQuiz),
router.post('/addquestion', teacherController.addQuestion),
router.get('/getallquestion/:id', teacherController.getAllQuestion),
router.delete('/deletequestion/:id', teacherController.deleteQuestion),

module.exports = router
