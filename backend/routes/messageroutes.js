const { addmsg, getallmsg , uploadfiles} = require("../controllers/messagecontroller");

const router = require("express").Router();



router.post("/addmessage/", addmsg),
router.get("/getallmessag/:conversation_id", getallmsg),
router.post("/uploadfiles/", uploadfiles),




module.exports = router;

