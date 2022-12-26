import express, { json } from 'express';
import DbConnection from './config/db.js';
import router from './routes/routes.js';
import courseRouter from './routes/courseRoutes.js';

const app = express();







DbConnection()

app.use(json()); 
app.use(router)
app.use("/",courseRouter)
app.listen(3000,()=> console.log('Server is running on port 3000'));


