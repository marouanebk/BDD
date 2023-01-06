const messagemodel = require("../models/messagemodel");

const multer = require("multer");
const fs = require("fs");


module.exports.addmsg = async(req,res,next)=>{
    try {
        const {from, conversation, message} = req.body;
        const data = await messagemodel.create({
            message: {text: message},
            convesation_id: conversation,
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
        const message = await messagemodel.find({
            conversation_id : req.params.conversation_id,
        }) .sort({updatedAt: 1});
        
        res.json(message);
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



    

