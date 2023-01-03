const express = require("express");
const mongoose = require("mongoose");
var teacherRoutes = require('./routes/teacher')
var studentRoutes = require('./routes/student')

mongoose.set('strictQuery', true);
var bodyParser = require('body-parser');

const app = express();
require("dotenv").config();


app.use(express.urlencoded({ extended: true }));
app.use(express.json());

mongoose.connect(process.env.MONGO_URL, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
}).then(()=> {
    console.log("DB connected");
}).catch((err)=>{
    console.log(err.message);
});

app.get('/', (req, res) => {
    res.send("Hellofrom quiz Server")
});

app.use('/student', studentRoutes);
app.use('/teacher', teacherRoutes);

const server = app.listen(process.env.PORT,()=>{
    console.log(`server is conected to port ${process.env.PORT}`);
});



