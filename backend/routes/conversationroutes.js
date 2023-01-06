const {addconversation,getconversations,addgrpconversation} = require("../controllers/conversationcontroller");

const router = require("express").Router();

router.post("/addconversation/", addconversation),
router.get("/getconversations/:user_id", getconversations),
router.post("/addgrpconversation/", addgrpconversation),

module.exports = router;
