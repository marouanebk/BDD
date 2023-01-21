const express = require("express");
const app = express();
require("dotenv").config();
const mongoose = require("mongoose");
const dbConfig = require("./config/db.config");
var teacherRoutes = require('./routes/teacher');
var studentRoutes = require('./routes/student');
const msgroutes = require("./routes/messageroutes");
const cnroutes = require("./routes/conversationroutes");
const grproutes = require("./routes/grouperoutes");
const socket = require("socket.io");
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
app.use("/counter", require("./routes/counter"));
app.use("/", require("./controllers/todoController"))
app.use("/courses", require("./routes/courseRoutes"))
app.use("/counter", require("./routes/counter")) 
app.use('/student', studentRoutes);
app.use('/teacher', teacherRoutes);
app.use("/api/message", msgroutes);
app.use("/api/conversation", cnroutes);
app.use("/api/groupe", grproutes);



// middleware for error responses
app.use(errors.errorHandler);

// listen for requests
let port = 4000;
const server = app.listen(port, function () {
  console.log("server running on port ", port);
});


const io = socket(server, {
  cors: {
    origin: "http://localhost:4000",
    credentials: true,
  },
});

global.onlineUsers = new Map();

io.on("connection", (socket) => {
  global.chatSocket = socket;
  socket.on("add-user", (userId) => {
    console.log("add user backend", userId);
    onlineUsers.set(userId, socket.id);
  });
  socket.on("send-msg", (data) => {
    console.log("in sending message ");
    console.log(chatSocket);
    console.log("data" + data);
    const sendUserSocket = onlineUsers.get(data.to);
    if (sendUserSocket) {
      console.log("trueeee");
      // { from: data.from, conversation: data.conversation, message: data.message }

      socket.to(sendUserSocket).emit("msg-recieve", data);
    } else {
      console.log("faaaalse");
    }
  });
  socket.on("send-file", (data) => {
    const sendUserSocket = onlineUsers.get(data.to);
    if (sendUserSocket) {
      socket.to(sendUserSocket).emit("file-recieve", data.type);
    }
  });

});