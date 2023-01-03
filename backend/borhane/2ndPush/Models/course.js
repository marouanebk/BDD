import mongoose from "mongoose";

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
        courseContent:[{ 
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

            quizzContent: [{
                question1: {
                    type: String,
                    required: false,
                },
                answer1_1: {
                    type: String,
                    required: false,
                },
                answer2_1: {
                    type: String,
                    required: false,
                },
                answer3_1: {
                    type: String,
                    required: false,
                },
                answer4_1: {
                    type: String,
                    required: false,
                },
                correctAnswer1: {
                    type: String,
                    required: false,
                },          
                question2: {
                    type: String,
                    required: false,
                },
                answer1_2: {
                    type: String,
                    required: false,
                },
                answer2_2: {
                    type: String,
                    required: false,
                },
                answer3_2: {
                    type: String,
                    required: false,
                },
                answer4_2: {
                    type: String,
                    required: false,
                },
                correctAnswer2: {
                    type: String,
                    required: false,
                },
            
                question3: {
                    type: String,
                    required: false,
                },
                answer1_3: {
                    type: String,
                    required: false,
                },
                answer2_3: {
                    type: String,
                    required: false,
                },
                answer3_3: {
                    type: String,
                    required: false,
                },
                answer4_3: {
                    type: String,
                    required: false,
                },
                correctAnswer3: {
                    type: String,
                    required: false,
                },
            },
            
]

        },
           

        ],

        
    },


);


export default mongoose.model("courses", courseSchema);