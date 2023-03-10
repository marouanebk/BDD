const mongoose = require("mongoose");

const messageSchema = new mongoose.Schema({
    message: {
        text: {
            type: String,
            required: false,
        },
    },
    convesation_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Conversation"
    },
    sender: {
        // type: mongoose.Schema.Types.ObjectId,
        // ref: "User",
        type : String,
        required: false,
    },

    type: {
        type: String,
    },


},
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("message", messageSchema);
