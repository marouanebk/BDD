import  user from '../Models/model.js';


// count the number of users that have been registered as a student

export const counter = async (req, res,next) => {
    let countStudent
    try{
    countStudent = await user.find({type : 'student'}).count();
    console.log(countStudent);
    res.status(200).json({countStudent:countStudent});
    }catch(err){
        
    console.log(err);
    res.status(500).json({error:err});
    }
       
    if(countStudent==0){
        res.status(200).json({message:'no student has been registered'});
    }
    let countTeacher 
    try{
        countTeacher = await user.find({type : 'teacher'}).count();
        console.log(countTeacher);
        res.status(200).json({countTeacher:countTeacher});
        }catch(err){
            console.log(err);
            res.status(500).json({error:err});
        }   
        if(countTeacher==0){
            res.status(200).json({message:'no teacher has been registered'});
        }

        const count = [];

        count.push({
            Student : countStudent,
            Teacher : countTeacher
            
        });

        return res.status(200).json(count);

    }



