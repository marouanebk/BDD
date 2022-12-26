import { Router } from 'express';
const router = Router(); 


import { connexion, inscription } from '../controllers/controller.js';


router.post('/inscription',inscription)
router.post('./connexion',connexion)


export default router
