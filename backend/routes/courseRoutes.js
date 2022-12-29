const express = require("express");
// import {getCourse,addCourse,updateCourse,getCourseByID,deleteCourseByID} from "../Controllers/courseController.js";
const courseRouter = express.Router();
const courseController = require("../controllers/courseController");



courseRouter.get('/getCourse', courseController.getCourse);
courseRouter.post('/addCourse',courseController.addCourse);
courseRouter.put('/updateCourse/:id',courseController.updateCourse);
courseRouter.get('/getCourseByID/:id',courseController.getCourseByID);
courseRouter.delete('/deleteCourseByID/:id',courseController.deleteCourseByID);


module.exports = courseRouter;
// module.exports = router;
