const { addmsg, getallmsg , uploadfiles, getusers} = require("../controllers/messagecontroller");

const router = require("express").Router();



router.post("/addmessage/", addmsg),
router.post("/getallmessag/", getallmsg),
router.post("/uploadfiles/", uploadfiles),
router.get("/getusers/", getusers);




module.exports = router;

