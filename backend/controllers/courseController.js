const courses = require("../Models/course.js");
const User = require("../models/user.model");



exports.getCourse = async (req, res, next) => {
    let course
    try {
        course = await courses.find();
    } catch (err) {
        return res.status(500).json({ message: err.message })
    }
    if (!course) {
        return res.status(404).json({ message: 'Cannot find course' })
    }
    return res.status(200).send({ result: course })
}

exports.getCourseByTeacherId = async (req, res, next) => {
    userid = req.params.id;

    let course
    try {
        course = await courses.find({ user: userid });
    } catch (err) {
        return res.status(500).json({ message: err.message })
    }
    if (!course) {
        return res.status(404).json({ message: 'Cannot find course' })
    }
    console.log(course);
    return res.status(200).send({ result: course })
}


exports.addCourse = async (req, res, next) => {
    console.log(req.body);
    console.log("in adding course funciton in backend");


    const { title, description, user, year, courseContent } = req.body
    var array = JSON.parse(courseContent.quizzContent);
    console.log(array);
    courseContent.quizzContent = array;
    console.log(courseContent);

    if (courseContent.quizzContent == null) {
        courseContent.quizzContent = undefined
    }
    if (courseContent.url == null) {
        courseContent.url == undefined
    }

    const newCourse = new courses({
        title,
        description,
        user,
        year,
        courseContent
    })

    try {
        await newCourse.save()
    } catch (err) {
        console.log("err" + err.message);
        return res.status(499).json({ message: err.message })
    }
    return res.status(200).json(newCourse)
}


exports.updateCourse = async (req, res, next) => {
    const { title, description, year, courseContent } = req.body
    const courseId = req.params.id;
    let course;
    try {
        course = await courses.findByIdAndUpdate(courseId, {
            title,
            description,
            year,
            courseContent
        })
    } catch (err) {
        return res.status(500).json({ message: err.message })

    }
    if (!course) {
        return res.status(404).json({ message: 'Cannot find course' })
    }
    return res.status(200).json(course)
}


exports.getCourseByID = async (req, res, next) => {

    const courseId = req.params.id;
    console.log(courseId);
    let course;
    try { course = await courses.findById({ _id: courseId }) } catch (err) {
        return res.status(500).json({ message: err.message })

    }
    if (!course) {
        return res.status(404).json({ message: 'Cannot find course' })
    }
    teacherid = course.user;
    console.log(teacherid);
    const _user = await User.findOne({ userid: teacherid });
    fullname = _user.fullname;
    return res.status(200).send({ result: { course, fullname } })
}

exports.addChapter = async (req, res, next) => {
    const newChapter = req.body;
    const courseId = req.params.id;

    console.log(newChapter);

    if (newChapter.quizzContent != "") {
        var array = JSON.parse(newChapter.quizzContent);
        console.log(array);
        newChapter.quizzContent = array;
        console.log(newChapter);
    }

    if (newChapter.quizzContent == "") {
        newChapter.quizzContent = undefined
    }
    if (newChapter.url == null) {
        newChapter.url == undefined
    }

    let course;

    if (newChapter === null) {
        // return res.status(404).json({ message: 'Cannot add chapter' });
    } else {

        try {
            course = await courses.findByIdAndUpdate(courseId, {
                $push: { courseContent: newChapter }
            })
        } catch (err) {
            return res.status(500).json({ message: err.message })

        }
        if (!course) {
            return res.status(404).json({ message: 'Cannot find course' })
        }

        return res.status(200).json(course)
    }
}



exports.deleteCourseByID = async (req, res, next) => {
    const courseId = req.params.id;
    let course;
    try { course = await courses.findByIdAndRemove(courseId) }
    catch (err) {
        return res.status(500).json({ message: err.message })

    }
    if (!course) {
        return res.status(404).json({ message: 'Cannot find course' })
    }
    return res.status(200).json({ message: 'Course deleted' })
} 