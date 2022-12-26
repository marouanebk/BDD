const mongoose = require("mongoose");

const TodoSchema = new mongoose.Schema({

  userid: {
    type: String,
    required: true,
  },
  todo: {
    type: String,
    required: true,
  },
  status: {
    type: String,
    default: "Undone"
  }
});

module.exports = new mongoose.model("Todo", TodoSchema);
