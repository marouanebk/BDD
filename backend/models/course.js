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
    // user: {
    //     type: String,
    //     required: true,
    // },
    user: { type: mongoose.Schema.Types.ObjectId, ref: "user" },
    courseContent: [{
        name: {
            type: String,
            required: true,
        },
        type: {
            type: String,
            required: true,
        },
        url: {
            type: String,
            required: false,
        },

        quizzContent: {}
    },

    ],
},


);


module.exports = new mongoose.model("courses", courseSchema);
