const conversationmodel = require("../models/conversationmodel");


module.exports.addconversation = async (req, res, next) => {
    try {
        const { from, to } = req.body;
        const data = await conversationmodel.create({
            users: [from, to],
        });
        if (data) return res.status(200).json({ msg: "conversation added successfully" });
        return res.json({ msg: "failed to add conversation to DB" });
    } catch (e) {
        next(e);
    }

};

module.exports.getconversations = async (req, res, next) => {
    console.log("in get conversations model");
    try {
        const conversation = await conversationmodel.find({
            users: {
                $in: [req.params.user_id],
            },
        }).sort({ updatedAt: 1 });

        res.status(200).json({ result: conversation });
    } catch (e) {
        next(e);
    }
};

module.exports.addgrpconversation = async (req, res, next) => {
    try {
        const { groupe } = req.body;
        const data = await conversationmodel.create({
            groupe_id: groupe,
            users: groupe.members,
        });
        if (data) return res.json({ msg: "grp conversation added successfully" });
        return res.json({ msg: "failed to add grp conversation to DB" });
    } catch (e) {
        next(e);
    }

};