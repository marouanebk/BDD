import { Router } from 'express';
const router = Router(); 


import { connexion, inscription , checkUser} from '../controllers/controller.js';


router.post('/inscription',inscription);
router.post('/connexion',connexion);
router.get('/checkUser' , checkUser); 



export default router
