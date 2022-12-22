import  {connect} from 'mongoose';

function DbConnection() {
    connect("mongodb://localhost:27017/authentification")
    .then(() => console.log('connection established'))
    .catch(err => console.log(err));

}


export default DbConnection
 


