const messagemodel = require("../models/messagemodel");
const multer = require("multer");
const fs = require("fs");


module.exports.addmsg = async(req,res,next)=>{
    try {
        const {from, to, message} = req.body;
        const data = await messagemodel.create({
            message: {text: message},
            users: [from, to],
            sender: from,
        });
        if (data) return res.json({ msg: "message added successfully"});
        return res.json({ msg: "failed to add message to DB"});
    } catch(e){
        next(e);
    }
};
module.exports.getallmsg = async(req,res,next)=>{
    try{
        const {from, to} = req.body;
        const message = await messagemodel.find({
            users : {
                $all : [from, to],
            },
        }) .sort({updatedAt: 1});
        const projectmessages = message.map(msg =>{
            return {
                if(fromSelf){
                fromSelf: msg.sender.toString() === from;
                 },
                message :msg.message.text,
            };
        });
        res.json(projectmessages);
    } catch(e){
        next(e);
    }
};
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, 'uploads/')
    },
    filename: function (req, file, cb) {
      const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9)
      cb(null, file.fieldname + file.originalname + '-' + uniqueSuffix)
    }
  });
  
  const upload = multer({ storage: storage }).single("file");

  module.exports.uploadfiles = async (req,res,next)=>{
    try{
        upload(req,res, err=>{
            if(err) {
                return res.json({success: false, err});
            }
            return res.json({success: true, url: res.req.file.path});
        });
    } catch(e){
        next(e);
    }
  };



    

