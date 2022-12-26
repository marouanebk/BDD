import express  from "express";
import {getCourse,addCourse,updateCourse,getCourseByID,deleteCourseByID} from "../Controllers/courseController.js";
const courseRouter = express.Router();


courseRouter.get('/getCourse', getCourse);
courseRouter.post('/addCourse',addCourse);
courseRouter.put('/updateCourse/:id',updateCourse);
courseRouter.get('/getCourseByID/:id',getCourseByID);
courseRouter.delete('/deleteCourseByID/:id',deleteCourseByID);



export default courseRouter ;

