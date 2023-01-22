const express = require("express");
// import {getCourse,addCourse,updateCourse,getCourseByID,deleteCourseByID} from "../Controllers/courseController.js";
const courseRouter = express.Router();
const courseController = require("../controllers/courseController");



courseRouter.get('/getCourse', courseController.getCourse);
courseRouter.get('/getCourseByTeacherId/:id', courseController.getCourseByTeacherId);
courseRouter.get('/getCourseByID/:id', courseController.getCourseByID);
courseRouter.get('/search/:key', courseController.search);

courseRouter.post('/addCourse', courseController.addCourse);

courseRouter.put('/updateCourse/:id', courseController.updateCourse);
courseRouter.put('/addChapter/:id', courseController.addChapter);


courseRouter.put('/enrollCourse', courseController.enrollCourse);
courseRouter.get('/getEnrolledCourses/:id', courseController.getEnrolledCourses);
courseRouter.get('/checkEnrolled/:id--:courseid', courseController.checkEnrolled);


courseRouter.delete('/deleteCourseByID/:id', courseController.deleteCourseByID);


module.exports = courseRouter;
// module.exports = router;
