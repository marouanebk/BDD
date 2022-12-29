const express = require("express");
const app = express();
const mongoose = require("mongoose");
const dbConfig = require("./config/db.config");

const auth = require("./middlewares/auth.js");
const errors = require("./middlewares/errors.js");
const unless = require("express-unless");


mongoose.Promise = global.Promise;
mongoose
  .connect("mongodb://0.0.0.0:27017/BddProject", {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(
    () => {
      console.log("Database connected");
    },
    (error) => {
      console.log("Database can't be connected: " + error);
    }
  );


auth.authenticateToken.unless = unless;
app.use(express.json());

// initialize routes
app.use("/users", require("./routes/users.routes"));
app.use("/", require("./controllers/todoController"))
app.use("/courses", require("./routes/courseRoutes"))


// middleware for error responses
app.use(errors.errorHandler);

// listen for requests
let port = 4000;
app.listen(port, function () {
  console.log("server running on port ", port);
});
