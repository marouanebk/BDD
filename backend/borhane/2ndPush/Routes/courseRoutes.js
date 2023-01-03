import express  from "express";
import {getCourse,addCourse,updateCourse,addChapter,getCourseByID,deleteCourseByID} from "../Controllers/courseController.js";
import {counter} from "../Controllers/counter.js";

const courseRouter = express.Router();

courseRouter.get('/counter',counter);
courseRouter.get('/getCourse', getCourse);
courseRouter.post('/addCourse',addCourse);
courseRouter.put('/updateCourse/:id',updateCourse);
courseRouter.put('/addChapter/:id',addChapter);
courseRouter.get('/getCourseByID/:id',getCourseByID);
courseRouter.delete('/deleteCourseByID/:id',deleteCourseByID);



export default courseRouter ;

