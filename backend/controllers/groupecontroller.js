const groupemodel = require("../models/groupemodel");

module.exports.addgroupe = async(req,res, next)=>{
    try{
        const {from, to, name} = req.body;
        const data = await groupemodel.create({
            name : name,
            members:[from, to],
            admin: from,
        });
        if (data) return res.json({ msg: "groupe added successfully"});
        return res.json({ msg: "failed to add groupe to DB"});
    } catch(e){
        next(e);
    }

};

module.exports.addtogroupe = async(req,res, next)=>{
    try{
        const {user_id,groupe_id} = req.body;
        const data = await groupemodel.updateMany(
            { _id: groupe_id},
            { $push: { members: user_id } },
        );
        if (data) return res.json({ msg: "user added successfully"});
        return res.json({ msg: "failed to add user to DB"});
    } catch(e){
        next(e);
    }

};

module.exports.removefromgroupe = async(req,res, next)=>{
    try{
        const {user_id,groupe_id} = req.body;
        const data = await groupemodel.updateMany(
            { _id: groupe_id},
            { $pull: { members: user_id } },
        );
        if (data) return res.json({ msg: "user removed successfully"});
        return res.json({ msg: "failed to remove user from DB"});
    } catch(e){
        next(e);
    }
};

