const express = require("express");
const app = express();
require("dotenv").config();
const mongoose = require("mongoose");
const dbConfig = require("./config/db.config");
var teacherRoutes = require('./routes/teacher');
var studentRoutes = require('./routes/student');
mongoose.set('strictQuery', true);

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


app.get('/', (req, res) => {
  res.send("Hellofrom quiz Server")
});
// initialize routes
app.use("/users", require("./routes/users.routes"));
app.use("/", require("./controllers/todoController"))
app.use("/courses", require("./routes/courseRoutes"))
app.use('/student', studentRoutes);
app.use('/teacher', teacherRoutes);

// middleware for error responses
app.use(errors.errorHandler);

// listen for requests
let port = 4000;
app.listen(port, function () {
  console.log("server running on port ", port);
});