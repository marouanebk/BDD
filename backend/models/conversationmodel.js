const mongoose = require("mongoose");

const conversationSchema = new mongoose.Schema({
    groupe_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Groupe"
    },
    users: [{
        type: mongoose.Schema.Types.ObjectId,
        ref: "user"

    }]


},
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("Conversation", conversationSchema);
