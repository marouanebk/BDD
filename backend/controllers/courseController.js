const courses = require("../Models/course.js");
const User = require("../models/user.model");



exports.getCourse = async (req, res, next) => {
    let course
    try {
        course = await courses.find()

        // .then(async cours => {
        //     let teachProfile = {};
        //     for (var i = 0; i < cours.length; i++) {
        //         let resulti = await User.find({ userid: cours[i].user }).profile_picture;
        //         teachProfile[i] =
        //             cours[i]


        //     }
        //     let resulta = []
        //     for (var key in teachProfile) {
        //         resulta.push(teachProfile[key])
        //     }
        //     return res.status(200).send({ result: resulta })

        // });
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
    courseContent.quizzContent = array;

    let userM;
    userM = await User.findById({ _id: user });
    console.log("userM            " + userM);


    if (courseContent.quizzContent == null) {
        courseContent.quizzContent = undefined
    }
    if (courseContent.url == null) {
        courseContent.url == undefined
    }

    const newCourse = new courses({
        title,
        description,
        userM,
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

exports.search = async (req, resp) => {
    let cours = await courses.find(
        {
            "$or": [
                { title: { $regex: req.params.key } },
            ]
        }
    )
    let users = await User.find(
        {
            fullname: { $regex: req.params.key },
            type: "Teacher"
        },
    )
    // resp.status(200).send({ "cours": cours, "people": users })
    resp.status(200).send({ cours, users })


}

exports.enrollCourse = async (req, res) => {
    let { userid, courseid } = req.body;
    console.log(userid , courseid);

    try {
        let user = await User.findOneAndUpdate({ userid: userid }, {
            $push: { courses: courseid }

        })

        let user2 = await User.findOne({userid : userid})

        res.status(200).send({result : user2 });

    }
    catch (e) {
        console.log(e);
        res.status(201).send({err : e })
    }
}

exports.getEnrolledCourses = async (req,res) => {
    let {userid} = req.body;
    try {
        let user = await User.findOne({userid: userid})
        let coursesArray = user.courses;
        console.log("courses for this user are ");
        // console.log(coursesArray);
        let founded = courses.find({
            '_id': { $in: [
                coursesArray
            ]}
        }, function(err, docs){
             console.log(docs);
        });
        console.log(founded);

    } catch (e) {
        console.log(e);
    }
}