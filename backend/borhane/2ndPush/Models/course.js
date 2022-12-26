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
    user : {
        type: String,
        required: true,
    },
    url : {
        type: String,
        required: true,
    },
});


export default mongoose.model("courses", courseSchema);
