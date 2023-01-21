const courses = require("../Models/course.js");
const user = require("../models/user.model");

// count the number of users that have been registered as a student

exports.counter = async (req, res, next) => {
    let countStudent
    try {
        countStudent = await user.find({ type: 'Student' }).count();
        console.log(countStudent);
    } catch (err) {

        console.log(err);
        res.status(500).json({ error: err });
    }

    let countTeacher
    try {
        countTeacher = await user.find({ type: 'Teacher' }).count();
        console.log(countTeacher);
        const coursesCounter = await courses.find().count();
        res.status(200).send({ result: { student: countStudent, teacher: countTeacher, courses: coursesCounter } })
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }


}



