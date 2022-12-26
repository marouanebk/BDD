import courses from "../Models/course.js";

export const getCourse = async (req, res,next) => {
    let course
    try {
        course = await courses.find()
    } catch (err) {
        return res.status(500).json({message: err.message})
    }
    if (!course) {
        return res.status(404).json({message: 'Cannot find course'})
    }
    return res.status(200).json(course)
}


export const addCourse = async (req, res,next) => {
    const {title,description,user,year,url} = req.body
    const newCourse = new courses({
        title,
        description,
        user,
        year,
        url
    })

    try {
        await newCourse.save()
    } catch (err) {
        return res.status(500).json({message: err.message})
    }
    return res.status(201).json(newCourse)
} 


export const updateCourse = async (req, res,next) => {
    const {title,description,year,url} = req.body
    const courseId = req.params.id;
    let course;
   try{ course = await courses.findByIdAndUpdate(courseId, {
        title,
        description,
        year,
        url
    })}catch(err){
        return res.status(500).json({message: err.message})

    }
    if (!course) {
        return res.status(404).json({message: 'Cannot find course'})
    }   
    return res.status(200).json(course)
}


export const getCourseByID = async (req, res,next) => {
    const courseId = req.params.id;
    let course;
   try{ course = await courses.findById(courseId)}catch(err){
        return res.status(500).json({message: err.message})

    }
    if (!course) {
        return res.status(404).json({message: 'Cannot find course'})
    }   
    return res.status(200).json(course)
}



export const deleteCourseByID = async (req, res,next) => {
    const courseId = req.params.id;
    let course;
   try{ course = await courses.findByIdAndRemove(courseId)}
   catch(err){
        return res.status(500).json({message: err.message})

    }
    if (!course) {
        return res.status(404).json({message: 'Cannot find course'})
    }   
    return res.status(200).json({message:'Course deleted'})
} 