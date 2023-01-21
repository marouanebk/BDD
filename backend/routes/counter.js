const express = require("express");
// import {getCourse,addCourse,updateCourse,getCourseByID,deleteCourseByID} from "../Controllers/courseController.js";
const counterRouter = express.Router();
const courseController = require("../controllers/counter");





counterRouter.get("/counter" , courseController.counter);

module.exports = counterRouter;
// module.exports = router;
