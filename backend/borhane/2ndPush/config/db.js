import  {connect} from 'mongoose';

const  DbConnection = async ()=> {
    await connect("mongodb://localhost:27017/authentification")
    .then(() => console.log('connection on mongodb established'))
    .catch(err => console.log(err));

}


export default DbConnection
 


