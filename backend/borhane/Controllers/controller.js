import express from 'express';
import user from '../models/model.js';
import userValidation from '../validation/validation.js';

import jwt from 'jsonwebtoken';
import { hash as _hash, compare } from 'bcrypt';''

/**
 * @param {express.Request} req
 * @param {express.Response} res
 */


export async function inscription(req,res) {

    /*const signInValidation = await userValidation(req.body).signup
    if (signInValidation) {
        if(signInValidation.error) return res.status(400).send(error.details[0].message);
    } else {
        return res.status(400).send("error");
    }*/
    await _hash(req.body.password, 10 ) 
    .then(async hash => {
        if(!hash){
            try {
                return res.status(500).json({msg :"server error"});
            } catch (error) {
                res.status(500).json({error})
            }
        }
        delete req.body.password;
        const newUser = new user({...req.body, password :hash});
        try{
            await newUser.save();
        } catch (error) {
            res.status(500).json({error})
        } finally  {
            res.status(200).json({msg: "user created"})
        }
    })
    .catch(error => res.status(500).json({error}));
}




/**
 * @param {express.Request} req
 * @param {express.Response} res
 */



export function connexion(req,res) {
    const {email,password} = req.body;
    console.log(email,password);

    // const {error} = userValidation(req.body).login
    // if(error) return res.status(401).send(error.details[0].message);
    
    user.findOne({email: email})
    .then(user => {
        if(!user) return res.status(404).json({msg: "user not found"});
        compare(password, user.password)
        .then(match => {
            if(!match) return res.status(500).json({msg: "wrong password"});
            res.status(200).json({
                email: user.email,
                id : user._id,
                token: jwt.sign({id : user._id},'Secter_Key',{expiresIn: '24h'})
            })
        })
        .catch(error => res.status(500).json({error}));
    })
    .catch(error => res.status(500).json({error}));


    
}



