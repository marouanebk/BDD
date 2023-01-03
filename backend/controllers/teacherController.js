var Quiz = require('../models/quiz');
var Question = require('../models/question');


exports.createQuiz = (req, res) => {
    var quiz = new Quiz({
        quizname: req.body.quizname,
        quizdescription: req.body.description,
        owner: req.body.owner,
        owneremail: req.body.owneremail,
    });
    quiz.save((error, qz) => {
        if (error) {
            console.log(error);
            res.json({ msg: "some error!" });
        }
        else {
            res.status(200).json({ message: "yes quiz added!!" })
        }
    })
};

exports.getquiz = (req, res) => {
    Quiz.find({ owner: req.body.owner}, (err, qz) => {
        if (err) {
            console.log(error);
            res.json({ msg: "some error!" });
        }
        else {
            res.json({ quiz: qz });
        }
    })
};

exports.addQuestion = (req, res) => {

    Question.find({ quizid: req.body.quizid }, (err, q) => {
        if (err) {
            console.log(error);
            res.json({ msg: "some error!" });
        }
        else {
            var question = new Question({
                quizid: req.body.quizid,
                questionId: q.length + 1,
                questionText: req.body.questionText,
                answer: req.body.answer,
                options: req.body.options
            });

            question.save((error, qsn) => {
                if (error) {
                    console.log(error);
                    res.json({ msg: "some error!" });
                }
                else {
                    res.status(200).json({ message: "yes question added!!" })
                }
            })
        }
    })
};



exports.deleteQuiz = (req, res) => {
    var id = req.params.id
    Quiz.deleteOne({ _id: id }, (err) => {
        if (err) {
            res.json({ msg: "Somthing went wrong!!" });
        }
    })
    Question.deleteMany({ quizid: id }, (err) => {
        if (err) {
            res.json({ msg: "Somthing went wrong!!" });
        }
    })
};   


exports.getAllQuestion = (req, res) => {
    Question.find({ quizid: req.params.id }, (err, qz) => {
        if (err) {
            console.log(error);
            res.json({ errormsg: "some error!" });
        }
        else {
            res.json({ msg: qz });
        }
    })
};


exports.deleteQuestion = (req, res) => {
    var id = req.params.id
    Question.deleteOne({ _id: id }, (err) => {
        if (err) {
            res.json({ msg: "Somthing went wrong!!" });
        }
    })
    res.json({ msg: "yes deleted" })
};



