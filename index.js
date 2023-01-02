const express = require("express");
const mongoose = require("mongoose");
const msgroutes = require("./routes/messageroutes");
const cnroutes = require("./routes/conversationroutes");
const grproutes = require("./routes/grouperoutes");

mongoose.set('strictQuery', true);
var bodyParser = require('body-parser');
const socket = require("socket.io");


const app = express();
require("dotenv").config();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json());

app.use("/api/message", msgroutes);
app.use("/api/conversation", cnroutes);
app.use("/api/groupe", grproutes);



mongoose.connect(process.env.MONGO_URL, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
}).then(()=> {
    console.log("DB connected");
}).catch((err)=>{
    console.log(err.message);
});

const server = app.listen(process.env.PORT,()=>{
    console.log(`server is conected to port ${process.env.PORT}`);
});

const io = socket(server, {
    cors:{
        origin: "http://localhost:5000",
        credentials: true,   
    },
});

global.onlineUsers = new Map();

io.on("connection", (socket) =>{
    global.chatSocket = socket;
    socket.on("add-user",(userId) =>{
        onlineUsers.set(userId, socket.id);
    });
    socket.on("send-msg",(data)=>{
        const sendUserSocket = onlineUsers.get(data.to);
        if(sendUserSocket) {
            socket.to(sendUserSocket).emit("msg-recieve", data.msg);
        }
    });
    socket.on("send-file",(data)=>{
        const sendUserSocket = onlineUsers.get(data.to);
        if(sendUserSocket) {
            socket.to(sendUserSocket).emit("file-recieve", data.type);
        }
    });

});

