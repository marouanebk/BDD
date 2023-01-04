const mongoose = require("mongoose");

const courseSchema = mongoose.Schema({
    title: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        required: true,
    },
    year: {
        type: String,
        required: true,
    },
    user: {
        type: String,
        required: true,
    },
    courseContent: [{
        name: {
            type: String,
            required: false,
        },
        type: {
            type: String,
            required: false,
        },
        url: {
            type: String,
            required: false,
        },

        quizzContent: {}
      
        

        // {
        //     question: {
        //         type: String,
        //         required: false,
        //     },
        //     answers: {
        //         type: String,
        //         required: false,
        //     },
        //     rightAnswer: {
        //         type: String,
        //         required: false,
        //     },
        // }




    },


    ],


},


);


module.exports = new mongoose.model("courses", courseSchema);
