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


exports.addCourse = async (req, res, next) => {
    const { title, description, user, year, courseContent } = req.body
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
        return res.status(500).json({ message: err.message })
    }
    return res.status(201).json(newCourse)
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
    let course;
    try { course = await courses.findById(courseId) } catch (err) {
        return res.status(500).json({ message: err.message })

    }
    if (!course) {
        return res.status(404).json({ message: 'Cannot find course' })
    }
    teacherid = course.user;
    const _user = await User.findOne({ _id: teacherid });
    fullname = _user.fullname;
    return res.status(200).send({ result: { course, fullname } })
}

exports.addChapter = async (req, res, next) => {
    const { newChapter } = req.body
    const courseId = req.params.id;

    let course;

    if (courseContent === null) {
        return res.status(404).json({ message: 'Cannot add chapter' });
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