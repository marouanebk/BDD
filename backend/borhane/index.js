import express, { json } from 'express';
import DbConnection from './config/db.js';
import router from './routes/routes.js';

const app = express();

DbConnection()

app.use(json()); 
app.use(router)
app.listen(3000,()=> console.log('hahahha mon pote'));


app.get('/login', (req, res) => {
    res.render('./googleauth.ejs');
});